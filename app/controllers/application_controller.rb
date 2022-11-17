class ApplicationController < ActionController::API
    # instruction to use cookies - all controllers inherit this and then have access to cookies hash
    include ActionController::Cookies

    #before any controller actions, user must be authorised/logged in and verified
    before_action :authorize

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  private

  #checks sessions for stored user id, if stored, is authorized
  def authorize
    @current_user = User.find_by(id: session[:user_id])
    render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
