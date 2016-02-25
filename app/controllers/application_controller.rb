class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  WHITELIST = ["97.124.120.200"]
  before_filter :check_whitelist

  def check_whitelist
    if WHITELIST.include?(request.remote_ip)
      true
    else
      render :text => "You are unauthorized"
      false
    end
  end
end
