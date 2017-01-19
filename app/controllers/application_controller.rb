class ApplicationController < ActionController::API
  include Knock::Authenticable

  def current_user
    @current_user ||= User.authenticate token
  end
end
