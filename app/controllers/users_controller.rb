class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def destroy_image
    @user = User.find(params[:user_id])
    @user.image.purge
    redirect_to edit_user_registration_path
  end

end
