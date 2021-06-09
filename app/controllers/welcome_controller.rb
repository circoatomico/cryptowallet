class WelcomeController < ApplicationController
  
  # layout "adm"

  def index
    cookies[:curso] = "Curso de Ruby on Rails - Jackson Pires - Cookie"
    session[:curso] = "Curso de Ruby on Rails - Jackson Pires - Session"
    @nome = ( params[:nome].present? ) ? params[:nome] : "teste"
    @curso = ( params[:curso].present? ) ? params[:curso] : "sla"
  end

  def show
  end
end
