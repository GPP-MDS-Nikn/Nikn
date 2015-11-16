class MortalityRatesController < ApplicationController
  # Bypass authorization check for charts controller.
  skip_authorization_check

  before_action :set_mortality_rate, only: [:show, :ediit, :update, :destroy]

  # The frequencies list must have this size
  # Be careful changing this line, some modifications must be done in the
  # controllers, HTMLs and JavaScripts of the application's charts.
  FREQUENCIES_LIST_SIZE = 6
  # This method creates a list with the mortality rate's frequencies 
  # for each region. The list contains indicators (in percentage) to
  # show mortality rate's seriousness. 
  # Each list contains 6 positions, in each position there are a percentage 
  # value that refers to how many cities are included in a arbitrary 
  # mortality rate range. 
  # For example, the first position indicates the frequency of cities with less 
  # than 5% in mortality rate's avaliations to a particular region.
  def index
    regions = ['Norte', 'Nordeste', 'Centro-Oeste', 'Sul', 'Sudeste']
    @mortality_rates_frequencies = Hash.new

    regions.each do |region_name|
      begin
        # Get a list of frequencies for each region
        @mortality_rates_frequencies[region_name.to_sym] = get_region_mortality_rate_frequency(region_name)
      rescue Errors::RegionNameError
        logger.info "[INFO] Skip the region #{region_name} and continue."
      end
    end
  end

  # Returns a new MortalityRate Model Object to be manually configured in the view form.
  def new
    # [TODO] This method should not exists unless it is used in the MortalityRate Parser.
    @mortality_rate = MortalityRate.new
  end

  # Tries to create and save a new MortalityRate object in the database and
  # redirects to the corresponding view.
  def create
    # [TODO] This method should not exists unless it is used in the MortalityRate Parser.

    @mortality_rate = MortalityRate.new(mortality_rate_params)

    respond_to do |format|
      if @mortality_rate.save
        format.html { redirect_to @mortality_rate, notice: 'Taxa de mortalidade foi criada com sucesso' }
        format.json { render :show, status: :created, location: @mortality_rate }
      else
        format.html { render :new }
        format.json { render json: @mortality_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # [TODO] This method should not exists unless it is used in the MortalityRate Parser.
    respond_to do |format|
      if @mortality_rate.update(mortality_rate_params)
        format.html { redirect_to @mortality_rate, notice: 'Taxa de mortalidade foi alterada com sucesso' }
        format.json { render :show, status: :ok, location: @mortality_rate }
      else
        format.html { render :edit }
        format.json { render json: @mortality_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # [TODO] This method should not exists unless it is used in the MortalityRate Parser.
    @mortality_rate.destroy
    respond_to do |format|
      format.html { redirect_to mortality_rates_url, notice: 'Taxa de mortalidade foi excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    # Takes an argument with the region name and returns a list with the
    # mortality rate's frequencies..
    # The list contains 6 positions, in each position there are a percentage 
    # value that refers to how many cities are included in a arbitrary 
    # mortality rate range. 
    def get_region_mortality_rate_frequency (region = nil)
      logger.debug "[DEBUG] Argument region: #{region}"
      logger.info "[INFO] Trying to get the mortality rate's frequencies list. Region: #{region}"

      # First, we need to verify if the region is registered as valid
      if is_region_valid? region
        logger.debug "[DEBUG] Region name validation method returned true."
        logger.info "[INFO] Region name is valid, continue."

        # Is necessary to get the number of registered region's data to calculate the average
        number_of_data_for_region = MortalityRate.where(regiao: region).count
        
        if number_of_data_for_region != 0
          # All the values below were arbitrarily selected, however it was designed to
          # give users a best experience reading the data.
          # Each nested list is a range with two limits, in percentage.
          # The first is the limit down, the second, limit up.
          # [PAY ATTENTION] be careful when you decide to change this list,
          # some modifications must be done in the index HTML and JavaScript view,
          # and this list should never be bigger than FREQUENCIES_LIST_SIZE!!
          rate_ranges = [[ 0.0 ,   8.0],
                        [ 8.0 ,  10.0],
                        [10.0 ,  12.0],
                        [12.0 ,  15.0],
                        [15.0 ,  20.0],
                        [20.0 , 100.0]]

          # Respect the list size limit
          # DO NOT remove this line!
          rate_ranges = rate_ranges[0...FREQUENCIES_LIST_SIZE]

          region_rates_frequency = [] # It will store the 6 frequency values.

          # Iterate over rate ranges and, for each range, calculate the frequency of cities
          # that belongs to the region and has the mortality rate included in the range.
          rate_ranges.each do |each_range|
            begin
              rates_per_range_counter = count_number_of_rates_in_limits(region, each_range[0], each_range[1])
              rates_per_range_frequency = (rates_per_range_counter.to_f/number_of_data_for_region.to_f)*100.0

              logger.debug "[DEBUG] each_range: #{each_range
              }, rates_per_range_counter: #{rates_per_range_counter
              }, number_of_data_for_region: #{number_of_data_for_region
              }, rates_per_range_frequency: #{rates_per_range_frequency}"

              region_rates_frequency << rates_per_range_frequency # Append the calculated frequency.
            rescue Errors::InvalidPercentageValueError
              logger.error "[ERROR] Any limit out of range: #{each_range}"
              logger.info "[INFO] Skip this range, going to the next range in the rate ranges list."
            end
          end

          logger.debug "[DEBUG] Exited rate_ranges loop with region_rates_frequency: #{region_rates_frequency}"
          return region_rates_frequency
        else
          # There is no data available to be calculated for this region
          logger.info "[INFO] There is no data for this region name."
          logger.debug "[DEBUG] number_of_data_for_region: 0"
          logger.warn "[WARN] There is no data for the region named \"#{region}\""

          return [0] * FREQUENCIES_LIST_SIZE# Displays nothing in the chart
        end
      else
        # The region name is invalid
        logger.debug "[DEBUG] Region name validation method returned false."
        logger.info "[INFO] Region name is invalid, break."
        logger.error "[ERROR] This region name is not registered: #{region}."

        # Must raise an invalid region name exception
        raise Errors::RegionNameError 
      end
    end

    # Takes three arguments, the first is the region name, necessary to
    # load all region rows of the database. The second and third arguments
    # are the limits. It returns how many region's cities have the mortality rate
    # between limits.
    # This method takes on region as valid data, please, be sure you've verified this before
    def count_number_of_rates_in_limits(region, limit_down, limit_up)
      logger.info "[INFO] Trying to count region's rates in the limits (#{limit_down} , #{limit_up})"

      if (is_limit_valid? limit_down) && (is_limit_valid? limit_up) # Verify if limits are valid
        rates_in_limits_counter = 0 # Counter of cities that rates are included in the limits.

        region_mortality_rate = MortalityRate.where(regiao: region) # Get all database's rows with the region name

        # Iterate over the loaded rows objects and increase the counter when find any that fits
        region_mortality_rate.each do |each_rate| 

          # This step is necessary because in the database's "taxa" column, the
          # data is storad as a string and instead of being separated by a dot, it
          # is separated by a comma, preventing direct convertion to float.
          fixed_rate_value = each_rate.taxa.gsub(',','.').to_f

          logger.debug "[DEBUG] region: #{region
          }, each_rate.nome: #{each_rate.nome
          }, each_rate.taxa: #{each_rate.taxa
          }, fixed_rate_value: #{fixed_rate_value}."

          if fixed_rate_value >= limit_down && fixed_rate_value < limit_up
            rates_in_limits_counter += 1
          else
            # Do nothing and continue
          end
        end
        
        logger.info "[INFO] Found #{rates_in_limits_counter} rates to the region: \"#{region}\""
        logger.debug "[DEBUG] Rates in the limits (#{limit_down}, #{limit_up}) | Got: #{rates_in_limits_counter}."
        return rates_in_limits_counter
      else
        # Limits are invalid
        logger.warn "[WARN] Limits are invalid!"
        logger.debug "[DEBUG] Invalid limit_down: #{limit_down} or limit_up: #{limit_up}"

        # Must raise an error for the invalid limit.
        raise Errors::InvalidPercentageValueError
      end
    end

    # Verify if limit is a valid value
    # It is a percentage value, so it
    # must be 0 <= x <= 100 and a float value.
    def is_limit_valid?(limit)
      return (limit.class == Float &&
              limit >= 0.0         &&
              limit <= 100.0)
    end

    # All the available region's name.
    # To add another region, take care with the index method and the view,
    def is_region_valid?(region)
      permitted_regions = ['Norte', 'Nordeste', 'Sul', 'Sudeste', 'Centro-Oeste']
      return permitted_regions.include? region
    end

    def set_mortality_rate
      @mortality_rate = MortalityRate.find(params[:id])
    end

    def mortality_rate_params
      params.require(:mortality_rate).permit(:regiao, :nome, :taxa)
    end
end
