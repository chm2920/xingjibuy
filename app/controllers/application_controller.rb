class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  #before_filter :check_user
  
  def check_user
    if session[:user_id].nil?
      session[:user_id] = request.remote_ip
    end
  end
  
  def current_cart
    begin
      @cart = Cart.find(session[:cart_id])
    rescue
      @cart = Cart.new
      @cart.user_id = session[:user_id] || 2
      @cart.ip = request.remote_ip
      @cart.save!
      session[:cart_id] = @cart
      @cart
    end
  end
  

  def self.rescue_errors
    rescue_from Exception,                            :with => :render_error
    rescue_from RuntimeError,                         :with => :render_error
    rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
    rescue_from ActionController::RoutingError,       :with => :render_not_found
    rescue_from ActionController::UnknownController,  :with => :render_not_found
    rescue_from ActionController::UnknownAction,      :with => :render_not_found
  end
  rescue_errors
  
  def render_not_found(exception=nil)
    record_error(params[:path])
    render :template => "errors/404", :status => 404
  end
  
  def render_error(exception)
    record_error(exception)
    render :template => "errors/500", :status => 500
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
      store_location
      redirect_to "/login"
    end
  end
  
  def record_error(e)
    RunLog.log_info(params, request, e)
  end
 
end
