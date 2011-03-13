class BuyController < ApplicationController
  
  def index
    begin
      @deal = Deal.find(params[:id])
      session[:deal_id] = @deal.id
    rescue
    end
  end
  
  def login
    if !session[:pay_user_id].nil?
      redirect_to "pay"
    end
  end
  
  def login_rst
    @user = User.first
    session[:pay_user_id] = @user.id
  end
  
  def pay
    if session[:pay_user_id].nil?
      redirect_to "login"
    end
  end
  
end
