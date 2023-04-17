class ApplicationController < ActionController::Base
  before_action :set_auth_user
  def set_auth_user
    if session[:user_id]
      Auth.user = User.find_by(id: session[:user_id])
    end
  end
end
