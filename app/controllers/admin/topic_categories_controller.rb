class Admin::TopicCategoriesController < Admin::AdminBackEndController
  
  before_filter :set_cur_panel_active
  
  def index
    @nodes = Node.all
    # @topic_categories = TopicCategory.all
  end

  def new
    @nodes = Node.all
    @topic_category = TopicCategory.new
  end

  def edit
    @nodes = Node.all
    @topic_category = TopicCategory.find(params[:id])
  end

  def create
    @topic_category = TopicCategory.new(params[:topic_category])
    if @topic_category.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @topic_category = TopicCategory.find(params[:id])
    if @topic_category.update_attributes(params[:topic_category])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @topic_category = TopicCategory.find(params[:id])
    @topic_category.destroy
    redirect_to :action => "index"
  end
  
private

  def set_cur_panel_active
    set_panel_active("SiteSettings", "topic_categories")
  end
  
end
