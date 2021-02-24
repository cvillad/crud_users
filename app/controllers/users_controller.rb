class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
        # flash[:notice] = "Init successfully"
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "User was created successfully"
            render :show
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "User was updated succesfully"
            redirect_to root_path
        else
            @user
            render :edit
        end
    end

    def destroy
        @user.destroy
        flash[:notice] = "User was deleted succesfully"
        redirect_to root_path
    end

    def destroy_image
        @user = User.find(params[:user_id])
        @user.image.purge
        redirect_to edit_user_path @user
    end

    private 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :description, :image)
    end

    def set_user
        @user = User.find(params[:id])
    end
end