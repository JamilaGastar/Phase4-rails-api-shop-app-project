class SessionsController < ApplicationController
  #skips authorize action for logging in access
  skip_before_action :authorize, only: :create

  #login in 
  def create
    #looks up user in database
    user = User.find_by(username: params[:username])
    #if found, authenticates and stores user id in session
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: :created
      else
    #if not found authentication fails and error is raised
        render json: { errors: ["Invalid username or password"] }, status: :unauthorized
      end
  end

  #clears user out of the session - logs out
  def destroy
    session.delete :user_id
    head :no_content
  end
end
