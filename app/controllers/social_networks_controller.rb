class SocialNetworksController < ApplicationController
    before_action :set_social_network, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only: [:new, :edit, :update, :create]

    def new
        @user = User.find(params[:user_id])
        @social_network = SocialNetwork.new
    end

    def edit
        @user = User.find(params[:user_id])
    end

    def update
        @user = User.find(params[:user_id])
        @social_network.update(social_network_params) 
        redirect_to user_path params[:user_id]
    end

    def create
        @user = User.find(params[:user_id])
        @social_network = @user.social_networks.new(social_network_params)
        if @social_network.save
            redirect_to user_path params[:user_id]
        else
            render :new
        end
    end

    def destroy
        @social_network.destroy
        redirect_to user_path params[:user_id]
    end

    private 

    def social_network_params
        params.require(:social_network).permit(:name, :link)
    end

    def set_social_network
        @social_network = SocialNetwork.find(params[:id])
    end

    def set_user
        @user = User.find(params[:user_id])
    end

end