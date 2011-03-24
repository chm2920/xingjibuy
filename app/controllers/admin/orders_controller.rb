class Admin::OrdersController < Admin::AdminBackEndController
  
  before_filter :set_cur_panel_active
  
  def index
    if !params[:order_ids].nil?
      Order.destroy_all(["id in (?)", params[:order_ids]])
    end
    if !params[:keyword].nil?
      @orders = Order.paginate :conditions => ["title like ?", "%" + params[:keyword] + "%"], :page => params[:page], :per_page => 15, :order => "id desc"
    else
      @orders = Order.paginate :page => params[:page], :per_page => 15, :order => "id desc"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to :action => "index"
  end
  
private

  def set_cur_panel_active
    set_panel_active("Orders", "orders")
  end
  
end
