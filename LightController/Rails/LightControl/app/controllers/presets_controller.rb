class PresetsController < ApplicationController
  # GET /presets
  # GET /presets.xml
  def index
    @presets = Preset.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @presets }
    end
  end
  
  def save
    @power_sockets = PowerSocket.all
    @preset = Preset.new :name => "My Preset"
    @preset.save
    @power_sockets.each do |power_socket|
      sa = SocketState.new :power_socket_id => power_socket.id, :preset_id => @preset.id, :state => power_socket.current_state;
      sa.save
    end
    
    respond_to do |format|
      format.html { redirect_to(presets_url) }
      format.mobile { render :text => @preset.id }
      format.xml  { render :xml => @presets }
    end
  end

  def rename
    @presets = Preset.all
    for preset in @presets
      preset.name = params["preset_#{preset.id}"]
      preset.save
    end
    respond_to do |format|
      format.html { redirect_to(preset_settings_url) }
      format.xml  { render :xml => @presets }
      format.mobile { redirect_to(presets_url)}
    end
  end

  # GET /presets/1
  # GET /presets/1.xml
  def show
    @preset = Preset.find(params[:id])

    @preset.power_sockets.each do |power_socket|
    	  ss = SocketState.where("preset_id=? AND power_socket_id=?",@preset.id,power_socket.id).first 
    	  power_socket.state = ss.state 
    end
    
    for preset in Preset.all
      preset.active = false
      preset.save
    end
    
    @preset.active = true
    @preset.save
    
    respond_to do |format|
      format.html { redirect_to(presets_url) }
      format.xml  { render :xml => @preset }
    end
  end

  # GET /presets/new
  # GET /presets/new.xml
  def new
    @preset = Preset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @preset }
    end
  end

  # GET /presets/1/edit
  def edit
    @preset = Preset.find(params[:id])
  end

  # POST /presets
  # POST /presets.xml
  def create
    @preset = Preset.new(params[:preset])

    respond_to do |format|
      if @preset.save
        format.html { redirect_to(@preset, :notice => 'Preset was successfully created.') }
        format.xml  { render :xml => @preset, :status => :created, :location => @preset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @preset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /presets/1
  # PUT /presets/1.xml
  def update
    @preset = Preset.find(params[:id])

    respond_to do |format|
      if @preset.update_attributes(params[:preset])
        format.html { redirect_to(@preset, :notice => 'Preset was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @preset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /presets/1
  # DELETE /presets/1.xml
  def destroy
    @preset = Preset.find(params[:id])
    @preset.destroy

    respond_to do |format|
      format.html { redirect_to(presets_url) }
      format.xml  { head :ok }
      format.mobile {render :text => ""}
    end
  end
end
