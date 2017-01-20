class ApplicationController < ActionController::API
  include Knock::Authenticable

  def current_user
    @current_user ||= token ? User.authenticate(token) : nil
  end
end
