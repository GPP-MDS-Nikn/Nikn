class MortalityRatesController < ApplicationController
  before_action :set_mortality_rate, only: [:show, :edit, :update, :destroy]

  def index
    @mortality_rates = MortalityRate.all
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
    def set_mortality_rate
      @mortality_rate = MortalityRate.find(params[:id])
    end

    def mortality_rate_params
      params.require(:mortality_rate).permit(:regiao, :nome, :taxa)
    end
end
