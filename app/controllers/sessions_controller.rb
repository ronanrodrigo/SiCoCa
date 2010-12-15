class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = Usuario.find(:first, :conditions => ['email = ? AND senha = ?', params[:login], params[:password]])
    if @user
      session[:logged] = true
      redirect_to :controller=>:home, :action=>:index, :notice => 'Login efetuado sucesso - '
    else
      render :action => "new"
    end
  end

  def destroy
    session[:logged] = false
    render :action => "new"
  end

end
