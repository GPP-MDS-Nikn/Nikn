class ParsersController < ApplicationController
  # Bypass authorization check for parsers controller.
  skip_authorization_check

  def importRate
    begin
      Parser.importRate(params[:file])
      redirect_to root_path, notice:  'CSV importado com sucesso'
    rescue
      redirect_to action: "new", notice:  'O arquivo tem formato inválido ou está em branco'
    end
  end
  def importCare
    begin
      Parser.importCare(params[:file])
      redirect_to root_path, notice:  'CSV importado com sucesso'
    rescue
      redirect_to action: "new", notice:  'O arquivo tem formato inválido ou está em branco'
    end
  end

  def parser_params
    params.require(:care_unit,
    							 :mortality_rate).permit(
    							 :municipio, :estado, :cod_mun7, :cod_mun6, :uf, :localizacao, # Care unit Params
    							 :regiao,:nome,:taxa) 																				 # Mortality rate params
  end
end
