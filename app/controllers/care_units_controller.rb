class CareUnitsController < ApplicationController
  before_action :set_care_unit, only: [:show, :edit, :update, :destroy]

  def index
    @care_units = CareUnit.all
  end

  def new
    @care_units = CareUnit.new
  end

  private

  def set_care_unit
    @care_units = CareUnit.find(params[:id])
  end

  def unit_params
      params.require(:care_unit).permit(:municipio, :estado, :cod_mun7, :cod_mun6, :uf, :localizacao)
  end
end
