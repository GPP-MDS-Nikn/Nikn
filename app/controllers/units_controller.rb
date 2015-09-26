class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  def index
    @units = Unit.all
  end

  def new
    @units = Unit.new
  end

  private

  def set_unit
    @units = Unit.find(params[:id])
  end

  def unit_params
    params.require(:unit).permit
  end
end
