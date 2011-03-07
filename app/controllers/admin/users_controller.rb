class Admin::UsersController < Admin::AdminBackEndController
  
  before_filter :set_cur_panel_active
  
  def index
    if !params[:user_ids].nil?
      User.destroy_all(["id in (?)", params[:user_ids]])
    end
    if !params[:keyword].nil?
      @users = User.paginate :conditions => ["username like ?", "%" + params[:keyword] + "%"], :page => params[:page], :per_page => 15, :order => "id desc"
    else
      @users = User.paginate :page => params[:page], :per_page => 15, :order => "id desc"
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action => :index
  end
  
private

  def set_cur_panel_active
    set_panel_active("Users", "users")
  end
  
end
