class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :protect

  def protect
    @ips = ['192.168.0.1','192.168.0.3'] #And so on ...]
    if request.remote_ip !~ /^XXX\.YYY\.ZZZ\./
      redirect_to no_access_url
      return false
    end
  end
end
