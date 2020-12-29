# typed: strict
class ApplicationController < ActionController::API
  extend T::Sig
  include JWTSessions::RailsAuthorization
  # protect_from_forgery prepend: true, with: :exception

  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  sig { void }
  def not_authorized
    render json: { error: 'Not Authorized' }, status: :forbidden
  end

  sig {returns(SearchQueryParams)}
  def query_params
    TypedParams[SearchQueryParams].new.extract!(T.cast(params.require(:query), ActionController::Parameters))
  end
end
