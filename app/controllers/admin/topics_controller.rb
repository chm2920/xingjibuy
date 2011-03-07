class Admin::TopicsController < Admin::AdminBackEndController
  
  before_filter :set_cur_panel_active

  def index
    if !params[:topic_ids].nil?
      Topic.destroy_all(["id in (?)", params[:topic_ids]])
    end
    if !params[:keyword].nil?
      @users = Topic.paginate :conditions => ["title like ?", "%" + params[:keyword] + "%"], :page => params[:page], :per_page => 15, :order => "id desc"
    else
      @topics = Topic.paginate :page => params[:page], :per_page => 15, :order => "id desc"
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to :action => :index
  end
  
private

  def set_cur_panel_active
    set_panel_active("Appearance", "topics")
  end
  
end
