class ParsersController < ApplicationController
  def import
    begin
      Parser.import(params[:file])
      redirect_to root_path, notice:  'CSV importado com sucesso'
    rescue
      redirect_to action: "new", notice:  'O arquivo tem formato inválido ou está em branco'
    end
  end

  def parser_params
    params.require(:care_unit).permit(:municipio, :estado, :cod_mun7, :cod_mun6, :uf, :localizacao)
  end
end
