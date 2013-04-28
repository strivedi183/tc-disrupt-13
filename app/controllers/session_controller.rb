class SessionController < ApplicationController

  def new
  end

  def create
    @auth = User.where(:email => params[:email]).first
    if @auth.present? && @auth.authenticate(params[:password])
      session[:user_id] = @auth.id
    else
    end
    authenticate
  end

  def destroy
    session[:user_id] = nil
    authenticate
    redirect_to root_path
  end

end