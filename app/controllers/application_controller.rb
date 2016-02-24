class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :block_foreign_hosts

  def whitelisted?(ip)
    return true if [192.168.0.1].include?(ip)
    false
  end

  def block_foreign_hosts
    return false if whitelisted?(request.remote_ip)
    redirect_to "https://www.google.com" unless request.remote_ip.start_with?("192.168.0")
  end

end
