class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  before_filter :check_user
  
  def check_user
    
  end

  def render_404
    render_optional_error_file(404)
  end
  
  def render_optional_error_file(status_code)
    status = status_code.to_s
    if ["404", "422", "500"].include?(status)
      render :template => "/errors/#{status}.html.erb", :status => status, :layout => "application"
    else
      render :template => "/errors/unknown.html.erb", :status => status, :layout => "application"
    end
  end
  
#  def self.rescue_errors
#    rescue_from Exception,                            :with => :render_error
#    rescue_from RuntimeError,                         :with => :render_error
#    rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
#    rescue_from ActionController::RoutingError,       :with => :render_not_found
#    rescue_from ActionController::UnknownController,  :with => :render_not_found
#    rescue_from ActionController::UnknownAction,      :with => :render_not_found
#   end
#   rescue_errors unless Rails.env.development?
   
  def render_not_found(exception = nil)
    render :template => "/errors/404", :status => 404
  end
   
  def render_error(exception = nil)
    render :template => "errors/500", :status => 500, :layout => 'public'
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back
    redirect_to(session[:return_to] || "/")
    session[:return_to] = nil
  end

  def require_user
    if !session[:user_id].nil?
      @current_user_id = session[:user_id]
    else
      redirect_to "/login"
      store_location
    end
  end
  
  def record_error(e)
    RunLog.log_info(params, request, e)
  end
 
end
