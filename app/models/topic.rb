class Topic < ActiveRecord::Base
  
  default_scope :order => 'created_at DESC'
  scope :recent, :limit => 10
  
  belongs_to :topic_category
  belongs_to :user
  
  has_many :comments, :dependent => :destroy
      
  def show_url
    "/topic/#{id}"
  end
  
end
