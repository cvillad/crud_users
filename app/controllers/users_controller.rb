class UsersController < ApplicationController

    def index
        @users = User.all
        # flash[:notice] = "Init successfully"
    end

    def show
        @user = User.find(params[:id])
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
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "User was updated succesfully"
            redirect_to root_path
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            flash[:notice] = "User was deleted succesfully"
            redirect_to root_path
        else
        
        end
    end

    private 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :description)
    end

end