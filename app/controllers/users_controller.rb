class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
  end

  def destroy_image
    @user = User.find(params[:user_id])
    @user.image.purge
    redirect_to edit_user_registration
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
