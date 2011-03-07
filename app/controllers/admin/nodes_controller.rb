class Admin::NodesController < Admin::AdminBackEndController
  
  before_filter :set_cur_panel_active
  
  def index
    @nodes = Node.all
  end

  def new
    @node = Node.new
  end

  def edit
    @node = Node.find(params[:id])
  end
  
  def create
    @node = Node.new(params[:node])
    if @node.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def update
    @node = Node.find(params[:id])
    if @node.update_attributes(params[:node])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def destroy
    @node = Node.find(params[:id])
    @node.destroy
    redirect_to :action => "index"
  end
  
private

  def set_cur_panel_active
    set_panel_active("SiteSettings", "nodes")
  end
  
end
