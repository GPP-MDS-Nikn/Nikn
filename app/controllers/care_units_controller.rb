class CareUnitsController < ApplicationController
  before_action :set_care_unit, only: [:show, :edit, :update, :destroy]

  # GET /care_units
  # GET /care_units.json
  def index
    if params[:search]
      @care_units = CareUnit.search(params[:search])
    else
      @care_units = CareUnit.all
    end
  end

  # GET /care_units/1
  # GET /care_units/1.json
  def show
  end

  # GET /care_units/new
  def new
    @care_unit = CareUnit.new
  end

  # GET /care_units/1/edit
  def edit
  end

  # POST /care_units
  # POST /care_units.json
  def create
    @care_unit = CareUnit.new(care_unit_params)

    respond_to do |format|
      if @care_unit.save
        format.html { redirect_to @care_unit, notice: 'Care unit was successfully created.' }
        format.json { render :show, status: :created, location: @care_unit }
      else
        format.html { render :new }
        format.json { render json: @care_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /care_units/1
  # PATCH/PUT /care_units/1.json
  def update
    respond_to do |format|
      if @care_unit.update(care_unit_params)
        format.html { redirect_to @care_unit, notice: 'Care unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @care_unit }
      else
        format.html { render :edit }
        format.json { render json: @care_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /care_units/1
  # DELETE /care_units/1.json
  def destroy
    @care_unit.destroy
    respond_to do |format|
      format.html { redirect_to care_units_url, notice: 'Care unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_unit
      @care_unit = CareUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def care_unit_params
      params.require(:care_unit).permit(:district, :category, :institution, :description, :name, :address, :zip_code, :city, :phone, :email, :site, :latitude, :longitude)
    end
end
