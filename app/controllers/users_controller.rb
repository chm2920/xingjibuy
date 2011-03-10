# coding: utf-8  
class UsersController < ApplicationController

  def reg
    @user = User.new
    #@user = User.first
    #UserMailer.welcome(@user).deliver
  end

  def create
    @user = User.new(params[:user])
    @user.email = params[:user][:email]
    @user.username = params[:user][:username]
    @user.current_login_ip = request.remote_ip
    @user.last_login_ip = request.remote_ip
    ActiveRecord::Base.transaction do
      begin
        @user.save!
        UserMailer.welcome(@user).deliver
      rescue Exception => e
        ActiveRecord::Rollback
        #render :text => e
        render :action => "reg", :user => @user
      else
        render :action => "create"
      end
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def login
  end
  
  def login_rst
    @user = User.check_login(params[:users][:email], params[:users][:password])
    if @user
      session[:user_id] = @user.id
      redirect_back
    else
      flash[:notice] = '邮箱地址 或 密码错误.'
      render :action => "login"
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to "/"
  end
  
  def send_activate_email
    @user = User.first
    UserMailer.welcome(@user).deliver
  end
  
  def activate
    
  end
  
end
