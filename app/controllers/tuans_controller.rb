class TuansController < ApplicationController

  def index
    @tuans = Tuan.all
  end

  # GET /tuans/1
  # GET /tuans/1.xml
  def show
    @tuan = Tuan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tuan }
    end
  end

  # GET /tuans/new
  # GET /tuans/new.xml
  def new
    @tuan = Tuan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tuan }
    end
  end

  # GET /tuans/1/edit
  def edit
    @tuan = Tuan.find(params[:id])
  end

  # POST /tuans
  # POST /tuans.xml
  def create
    @tuan = Tuan.new(params[:tuan])

    respond_to do |format|
      if @tuan.save
        format.html { redirect_to(@tuan, :notice => 'Tuan was successfully created.') }
        format.xml  { render :xml => @tuan, :status => :created, :location => @tuan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tuan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tuans/1
  # PUT /tuans/1.xml
  def update
    @tuan = Tuan.find(params[:id])

    respond_to do |format|
      if @tuan.update_attributes(params[:tuan])
        format.html { redirect_to(@tuan, :notice => 'Tuan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tuan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tuans/1
  # DELETE /tuans/1.xml
  def destroy
    @tuan = Tuan.find(params[:id])
    @tuan.destroy

    respond_to do |format|
      format.html { redirect_to(tuans_url) }
      format.xml  { head :ok }
    end
  end
end
