class HomeController < ApplicationController

  before_filter :authenticate

  def index
  end

  protected

  def authenticate
    if session[:logged]
      true
    else
      redirect_to :root
    end
  end
end
