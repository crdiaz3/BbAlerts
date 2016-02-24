class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  WHITELIST = ['192.168.0.1'].freeze
  def authorize_by_ip
    unless( WHITELIST.include? request.env['REMOTE_ADDR'] )
      render :file => "#{Rails.public_path}/401.html", :status
      => :unauthorized
      return
    end
  end

end
