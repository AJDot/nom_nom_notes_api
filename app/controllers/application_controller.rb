# typed: true
class ApplicationController < ActionController::API
  class SearchQueryParams < T::Struct
    const :term, String
    const :not, T.nilable(T::Hash[Symbol, T.untyped])
  end

  include JWTSessions::RailsAuthorization
  # protect_from_forgery prepend: true, with: :exception

  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  # def current_user
  #   @current_user ||= User.find(payload['user_id'])
  # end

  def not_authorized
    render json: { error: 'Not Authorized' }, status: :forbidden
  end

  def query_params
    TypedParams[SearchQueryParams].new.extract!(T.cast(params.require(:query), ActionController::Parameters))
  end
end
