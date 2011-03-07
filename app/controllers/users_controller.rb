# coding: utf-8  
class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def topics    
    @user = User.find(params[:id])
    @topics = @user.topics.paginate :page => params[:page], :per_page => 10, :order => 'id desc'
  end
  
  def comments
    @user = User.find(params[:id])
    @comments = @user.comments.paginate :page => params[:page], :per_page => 10, :order => 'id desc'
  end

  def reg
    @user = User.new
  end
  
  def reg_rst
    
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :action => "new"
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
  
end
