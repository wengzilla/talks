class UsersController < ApplicationController
  protect_from_forgery

  def show
    user
  end

  def edit
    user
  end

  def update
    user.update_attributes(params[:user])
  end

  def user
    @user = User.find_by_username(params[:id]) || User.find(params[:id])
  end
end
