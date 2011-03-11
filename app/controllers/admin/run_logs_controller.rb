class Admin::RunLogsController < Admin::AdminBackEndController
  
  before_filter :set_cur_panel_active
  
  def index
    if !params[:log_ids].nil?
      RunLog.destroy_all(["id in (?)", params[:log_ids]])
    end
    if !params[:keyword].nil?
      @logs = RunLog.paginate :conditions => ["log_path like ?", "%" + params[:keyword] + "%"], :page => params[:page], :per_page => 15, :order => "id desc"
    else
      @logs = RunLog.paginate :page => params[:page], :per_page => 15, :order => "id desc"
    end
  end

  def show
    @log = RunLog.find(params[:id])
  end
  
  def destroy
    @log = RunLog.find(params[:id])
    @log.destroy
    redirect_to :action => :index
  end
  
private

  def set_cur_panel_active
    set_panel_active("RunLogs", "run_logs")
  end
  
end
