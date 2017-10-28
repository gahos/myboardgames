class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def require_correct_user
    unless logged_in?
      redirect_to login_url
    else
      unless correct_user?
        redirect_to user_path(current_user)
      end
    end
  end

end