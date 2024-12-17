# frozen_string_literal: true

# Main controller that all other controllers should inherit from
class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  serialization_scope :view_context
  # protect_from_forgery prepend: true, with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: exception.message }, status: :forbidden
  end

  before_action :transform_params_if_multipart!

  private
  
  alias :current_user :current_account 

  def authenticate!
    rodauth.require_account # redirect to login page if not authenticated
  end

  def not_authorized
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end

  def query_params
    return {} unless params[:query].present?

    query_action_params = ActionController::Parameters.new(query: JSON.parse(params[:query]))
    query_action_params.require(:query).permit(
      :term,
      not: [
        client_id: [],
      ],
    )
  end

  def transform_params_if_multipart!
    return unless %r{^multipart/form-data*}.match(request.headers['content-type'])

    self.params = ActionController::Parameters.new(params.permit!.to_h.deep_transform_keys(&:underscore))
  end
end
