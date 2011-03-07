class User < ActiveRecord::Base
  
  before_save :encryted_password
  
  # named_scope :with_name_like, lambda {|str| :conditions => ['lower(username) like ?', %(%#{str.downcase}%)]}
  
  has_many :topics
  has_many :comments
  has_many :bookmarks
  
  attr_accessor :password_confirmation
  
  def self.check_login(email, password)
    user = self.find_by_email(email)
    if user
      if Digest::MD5.hexdigest(password).to_s!=user.password.to_s
        nil
      else
        user
      end
    else
      nil
    end
  end
  
  def show_url
    "/profile/#{id}"
  end
  
private
  
  def encryted_password
    self.password = Digest::MD5.hexdigest(self.password)
  end
  
end
