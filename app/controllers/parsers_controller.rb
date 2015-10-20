class ParsersController < ApplicationController
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
    params.require(:care_unit,:mortality_rate).permit(:municipio, :estado, :cod_mun7, :cod_mun6, :uf, :localizacao,:regiao,:nome,:taxa)
  end
end
