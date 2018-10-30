class ApplicationController < ActionController::API
  include ActionController::Serialization

  # before_action :authenticate
  # rescue_from CanCan::AccessDenied, with: :forbidden_access
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  # Authenticate the user with token based authentication
  def authenticate
      authenticate_token
  end

  def authenticate_token
    # authenticate_with_http_token do |token, options|
    #     @current_user = User.find_by(api_key: token)
    # end
  end

  def forbidden_access
    render_error_state 'Access forbidden', :forbidden
  end

  def record_not_found
    render_error_state 'Not found', :not_found
  end

  def render_error_state(err_msg, status)
    render json: { error: err_msg }, status: status
  end

  def render_success_json(status = :ok)
    render json: { success: true }, status: status
  end

end
