class Cart < ActiveRecord::Base
  
  belongs_to :user
  has_many :cart_items, :dependent => :destroy
  
  def add_to_cart(deal)
    if !cart_items.map{|item|item.deal_id}.include? deal.id
      item = CartItem.new(:deal => deal)
      item.quantity = 1
      cart_items << item      
    end
    cart_items
  end
  
  def total_price
    cart_items.to_a.sum{|item|item.total_price}
  end
  
end
