class ParsersController < ApplicationController

  def import
     Parser.import(params[:file])
     redirect_to root_path, notice:  "CSV importado com sucesso"
  end

  def parser_params
      params.require(:unit)
  end

end
