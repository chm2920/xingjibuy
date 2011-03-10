class User < ActiveRecord::Base
  
  before_create :default_value_for_create
  #after_create :send_welcome_mail
  
  #attr_protected :email, :username, :state
  attr_accessor :password_confirm
  
  validate do |user|
    if user.new_record? #adds validation if it is a new record
      user.errors.add(:password, "is required") if user.password.blank? 
      user.errors.add(:password_confirm, "is required") if user.password_confirm.blank?
      user.errors.add(:password, "Password and confirmation must match") if user.password != user.password_confirm
    elsif !(!user.new_record? && user.password.blank? && user.password_confirm.blank?) #adds validation only if password or password_confirmation are modified
      user.errors.add(:password, "is required") if user.password.blank?
      user.errors.add(:password_confirm, "is required") if user.password_confirm.blank?
      user.errors.add(:password, " and confirmation must match.") if user.password != user.password_confirm
      user.errors.add(:password, " and confirmation should be atleast 4 characters long.") if user.password.length < 4 || user.password_confirm.length < 4
    end
  end  
  
  validates_presence_of :username
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email
  
  STATE = {
    :new => 0,
    :normal => 1,
    # 屏蔽
    :blocked => 2
  }
  
  def self.check_login(email, password)
    user = self.find_by_email(email)
    if user
      if encrypted_password(password).to_s!=user.password.to_s
        nil
      else
        user
      end
    else
      nil
    end
  end
  
#  def send_welcome_mail
#    m = UserMailer.welcome(self)
#    Thread.new { m.deliver }
#  rescue => e
#    logger.error { e }
#  end
  
  def default_value_for_create
    self.password = encrypted_password(self.password)
    self.salt = generate_salt
    self.state = STATE[:new]
    self.last_login_at = Time.now
  end

  def generate_salt
    encrypted_password(self.email + "xingjibuy")
  end
  
  def encrypted_password(password)
    Digest::MD5.hexdigest(password)
  end
  
end
