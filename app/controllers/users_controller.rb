class UsersController < ApplicationController
    #skips authorize action only for creating a new user
    skip_before_action :authorize, only: :create

    def create
      user = User.create!(user_params)
      session[:user_id] = user.id
      render json: user, status: :created
    end

    def show
        render json: @current_user, include: :items
    end

    private
    def user_params
        params.permit(:first_name, :username, :password, :password_confirmation, :phone_number, :email_address, :location, :bio, :image_url)
    end

end
