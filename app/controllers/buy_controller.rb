class BuyController < ApplicationController
  
  def index
    begin
      @deal = Deal.find(params[:id])
      @cart = current_cart
      @cart_items = @cart.add_to_cart(@deal)
      session[:cart_id] = @cart.id
      redirect_to "/cart"
    rescue
    else
    end
  end
  
  def cart
    @cart = current_cart
    @cart_items = @cart.cart_items
  end
  
  def record_cart
    if session[:user_id].nil?
      store_location
      redirect_to "/login"
    else
      begin
        @cart = current_cart
        @cart.user_id = session[:user_id]
        @cart.save!
        @cart_items = @cart.cart_items
        if session[:order_id].nil?
          order = Order.new
          order.user_id = session[:user_id]
          order.status = 1
          order.save!
          session[:order_id] = order.id
        else
          order = Order.find(session[:order_id])
          order.order_items.each do |item|
            item.destroy
          end
        end
        order_items = order.order_items
        @cart_items.each do |item|
          order_item = OrderItem.new
          order_item.deal_id = item.deal_id
          order_item.quantity = item.quantity
          order_items << order_item
        end
        redirect_to "/delivery"
      rescue Exception => e
        ActiveRecord::Rollback
        record_error(e)
        render :action => "cart"
      end
    end
  end
  
  def delivery
    if session[:user_id].nil?
      store_location
      redirect_to "/login"
    end
    if session[:address_id].nil?
      @address = Address.new
    else
      @address = Address.find(session[:address_id])
    end
  end
  
  def record_delivery
    @address = Address.new
    @address.user_id = session[:user_id]
    @address.username = params[:receiverName]
    @address.city = params[:city] + params[:district]
    @address.street = params[:street]
    @address.postcode = params[:postcode]
    @address.mobile = params[:mobile]
    @address.phone = params[:phone_area] + params[:phone_number] + params[:phone_ext]
    @address.deliveryType = params[:deliveryType]
    @address.remark = params[:remark]
    ActiveRecord::Base.transaction do
      begin
        @address.save!
        session[:address_id] = @address.id
        @order = Order.find(session[:order_id])
        @order.address_id = @address.id
        @order.save!
      rescue Exception => e
        ActiveRecord::Rollback
        record_error(e)
        render :action => "delivery"
      else
        redirect_to "/pay"
      end
    end
  end
  
  def empty_cart
    @cart = current_cart
    @cart.destroy
    redirect_to "/"
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

  end
  
end
