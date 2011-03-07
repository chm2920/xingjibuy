class TopicCategory < ActiveRecord::Base
  
  belongs_to :node
  has_many :topics, :dependent => :destroy
  
  def show_url
    "/category/#{url}"
  end
  
end
