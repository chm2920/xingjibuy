class Admin::DashboardController < Admin::AdminBackEndController
  
  def index
    set_panel_active("Dashboard", "admin")
  end
  
end
