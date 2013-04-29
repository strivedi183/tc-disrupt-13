class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    user = User.create(params[:user])
    redirect_to root_path
  end
  def edit
  end
  def update
  end
  def show
    @events = Event.where(:user_id => params[:id])
  end
  def destroy
  end
end