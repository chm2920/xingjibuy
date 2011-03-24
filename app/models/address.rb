class Address < ActiveRecord::Base
  
  belongs_to :user
  has_many :orders
  
  validates_presence_of :user_id, :username, :city, :street, :postcode
  
end
