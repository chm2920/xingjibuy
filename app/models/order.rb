class Order < ActiveRecord::Base
  
  has_many :order_items
  belongs_to :user
  belongs_to :address
  
  def add_order_items_from_cart(cart)
    cart.cart_items.each do |item|
      order_item = OrderItem.new
      order_item.deal_id = item.deal_id
      order_item.quantity = item.quantity
      item.destroy
      order_items << order_item
    end
  end
  
end
