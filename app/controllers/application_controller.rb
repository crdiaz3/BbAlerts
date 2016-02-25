class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :block_ip

  def block_ip
    if request.remote_ip.match('127.0.0.*')
      redirect_to "http://YourCanonicalDomain.tld/503.html"
      return
    end
  end
end
