module UsersHelper
  
  def any_email_login_addr(email)
    "http://www." + email[(email=~/@/)+1..email.length]
  end
  
end
