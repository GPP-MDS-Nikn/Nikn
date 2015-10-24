class MortalityRatesController < ApplicationController
  before_action :set_mortality_rate, only: [:show, :edit, :update, :destroy]

  def index
    @north_mortality_rates_frequencies = get_region_mortality_rate_frequency('Norte')
    @northeast_mortality_rates_frequencies = get_region_mortality_rate_frequency('Nordeste')
    @centerwest_mortality_rates_frequencies = get_region_mortality_rate_frequency('Centro-Oeste')
    @south_mortality_rates_frequencies = get_region_mortality_rate_frequency('Sul')
    @southeast_mortality_rates_frequencies = get_region_mortality_rate_frequency('Sudeste')
  end

  def new
    @mortality_rate = MortalityRate.new
  end

  def create
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
    @mortality_rate.destroy
    respond_to do |format|
      format.html { redirect_to mortality_rates_url, notice: 'Taxa de mortalidade foi excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def get_region_mortality_rate_frequency (region = nil)
      if is_region_valid? region

        logger.debug "Valid region: #{region}."

        number_of_data_for_region = MortalityRate.where(regiao: region).count
        
        rate_ranges = [[0.0, 5.0],
                       [5.0, 20.0],
                       [20.0, 40.0],
                       [40.0, 60.0],
                       [60.0, 80.0],
                       [80.0, 100.0]]

        region_rates_frequency = []
        rate_ranges.each do |each_range|
          rates_per_range_counter = count_number_of_rates_in_limits(region, each_range[0], each_range[1])

          rates_per_range_frequency = (rates_per_range_counter.to_f/number_of_data_for_region.to_f)*100.0

          logger.debug "DEBUG: RANGE: #{each_range
          }, NUMBER OF RATES: #{rates_per_range_counter
          }, TOTAL RATES: #{number_of_data_for_region
          }, FREQUENCY: #{rates_per_range_frequency}"

          region_rates_frequency << rates_per_range_frequency
        end

        logger.debug "DEBUG: Array of frequecies per region #{region_rates_frequency}"
        return region_rates_frequency
      else
        # [TODO] raise an exception for region name error
      end
    end

    def count_number_of_rates_in_limits(region, limit_down, limit_up)
      # This method takes on region as valid data 
      if limit_down.class == Float && limit_up.class == Float
        rates_in_limits_counter = 0

      region_mortality_rate = MortalityRate.where(regiao: region)
      region_mortality_rate.each do |each_rate| 
          rate_value = each_rate.taxa.gsub(',','.').to_f

          logger.debug "DEBUG: REGION: #{region}, NAME: #{each_rate.nome}, RATE(String): #{each_rate.taxa}, RATE(Float Converted): #{rate_value}."
          if rate_value >= limit_down && rate_value < limit_up
            rates_in_limits_counter += 1
          else
            # Do nothing and continue
          end
        end

        logger.debug "DEBUG: Rates in the limits (#{limit_down}, #{limit_up}) | Got: #{rates_in_limits_counter}."
        return rates_in_limits_counter
      else
        # [TODO] raise an exception for Float error
      end
    end

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
