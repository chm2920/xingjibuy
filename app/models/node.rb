class Node < ActiveRecord::Base
  
  has_many :topic_categories, :dependent => :destroy
  
end
