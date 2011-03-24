# coding: utf-8  

User.destroy_all
User.create(:email => "chm2920@gmail.com", :username => "master", :password => "123456")

User.create(:email => "guest@gmail.com", :username => "guest", :password => "123456")

#