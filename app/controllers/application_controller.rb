class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :protect

  def protect
    @ips = ['192.168.0.1','192.168.0.3'] #And so on ...]
    if not @ips.include? request.remote_ip
       # Check for your subnet stuff here, for example
       # if not request.remote_ip.include?('127.0,0')
       render :text => "You are unauthorized"
       return
    end
  end
end
