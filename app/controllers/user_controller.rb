class UserController < ApplicationController

    def index
        @users = User.all
        # flash[:notice] = "Init successfully"
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to root_path
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end

    private 


    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :description, :social_media, :password)
    end

end