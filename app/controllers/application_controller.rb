class ApplicationController < ActionController::Base
  before_action { set_default_format_to_json }

  def set_default_format_to_json
    request.format = :json if params[:format].nil? && request.headers['HTTP_ACCEPT'].nil?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
