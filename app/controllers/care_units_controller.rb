class CareUnitsController < ApplicationController
  before_action :set_care_unit, only: [:show, :edit, :update, :destroy]

  # Use this controller as a resource of CanCan and Rolify
  skip_authorization_check
  def index
    # This conditional structure returns to the view the result of
    # the user search in case of a request.
    if params[:search]
      @care_units = CareUnit.search(params[:search])
    else
      @care_units = CareUnit.all
    end

    # This hash returns all the map points to plot in the Google map plugin.
    @hash = Gmaps4rails.build_markers(@care_units) do |care_unit, marker|
      marker.lat care_unit.latitude
      marker.lng care_unit.longitude
      marker.infowindow care_unit.name
    end
  end

  def show
  end

  def new
    @care_unit = CareUnit.new
  end

  def edit
  end

  def create
    @care_unit = CareUnit.new(care_unit_params)

    respond_to do |format|
      if @care_unit.save
        format.html { redirect_to care_units_path, notice: 'Care unit was successfully created.' }
        format.json { render :index, status: :created, location: care_units_path }
      else
        format.html { render :new }
        format.json { render json: @care_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @care_unit.update(care_unit_params)
        format.html { redirect_to care_units_path, notice: 'Care unit was successfully updated.' }
        format.json { render :index, status: :ok, location: care_units_path }
      else
        format.html { render :edit }
        format.json { render json: @care_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @care_unit.destroy
    respond_to do |format|
      format.html { redirect_to care_units_path, notice: 'Care unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_care_unit
      @care_unit = CareUnit.find(params[:id])
    end

    def care_unit_params
      params.require(:care_unit).permit(:district, :category, :institution, :description, :name, :address, :zip_code, :city, :phone, :email, :site, :latitude, :longitude)
    end
end
