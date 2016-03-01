class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  WHITELIST = ["97.124.120.200", "209.147.144.29", "209.147.144.38"]
  before_filter :check_whitelist

  def index
    render(:text => "You are not authorized to view this page.")
  end

  def check_whitelist
    if WHITELIST.include?(request.remote_ip)
      true
    else
      render(:nothing => true, :status => 401)
      false
    end
  end
end
