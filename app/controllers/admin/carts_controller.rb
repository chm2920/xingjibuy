class Admin::CartsController < Admin::AdminBackEndController
  
  before_filter :set_cur_panel_active
  
  def index
    if !params[:cart_ids].nil?
      Cart.destroy_all(["id in (?)", params[:cart_ids]])
    end
    if !params[:keyword].nil?
      @carts = Cart.paginate :conditions => ["ip like ?", "%" + params[:keyword] + "%"], :page => params[:page], :per_page => 15, :order => "id desc"
    else
      @carts = Cart.paginate :page => params[:page], :per_page => 15, :order => "id desc"
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to :action => "index"
  end
  
private

  def set_cur_panel_active
    set_panel_active("Orders", "carts")
  end
  
end
