class TopicsController < ApplicationController
  
  before_filter :require_user, :only => ["new", "create", "edit", "update", "comment"]

  def index
    @topics = Topic.paginate :page => params[:page], :per_page => 15
  end
  
  def search
    @topics = Topic.paginate :conditions => ["title like ?", "%" + params[:keyword] + "%"], :page => params[:page], :per_page => 15
    render :action => "index"
  end

  def show
    @topic = Topic.find(params[:id])
    @comments = @topic.comments
  end

  def new
    @nodes = Node.all
    @topic = Topic.new
  end

  def edit
    @nodes = Node.all
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.user_id = session[:user_id]
    if @topic.save
      redirect_to @topic
    else
      render :action => "index"
    end
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to :action => "show", :id => @topic.id
    else
      render :action => "edit"
    end
  end
  
  def comment
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.build(params[:comment])
    @comment.user_id = session[:user_id]
    if @comment.save
      redirect_to :action => "show", :id => @topic.id
    else
      render :action => "show", :id => @topic.id
    end
  end

end
