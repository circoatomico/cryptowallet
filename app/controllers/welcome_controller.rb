class WelcomeController < ApplicationController
  
  layout "adm"

  def index
    @nome = ( params[:nome].present? ) ? params[:nome] : "teste"
    @curso = ( params[:curso].present? ) ? params[:curso] : "sla"
  end

  def show
  end
end
