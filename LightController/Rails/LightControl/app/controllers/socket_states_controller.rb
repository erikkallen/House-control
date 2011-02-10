class SocketStatesController < ApplicationController
  # GET /socket_states
  # GET /socket_states.xml
  def index
    @presets = Preset.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @socket_states }
    end
  end

  # GET /socket_states/1
  # GET /socket_states/1.xml
  def show
    @socket_state = SocketState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @socket_state }
    end
  end

  # GET /socket_states/new
  # GET /socket_states/new.xml
  def new
    @socket_state = SocketState.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @socket_state }
    end
  end

  # GET /socket_states/1/edit
  def edit
    @socket_state = SocketState.find(params[:id])
  end

  # POST /socket_states
  # POST /socket_states.xml
  def create
    @socket_state = SocketState.new(params[:socket_state])

    respond_to do |format|
      if @socket_state.save
        format.html { redirect_to(socket_states_url, :notice => 'Socket state was successfully created.') }
        format.xml  { render :xml => @socket_state, :status => :created, :location => @socket_state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @socket_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /socket_states/1
  # PUT /socket_states/1.xml
  def update
    @socket_state = SocketState.find(params[:id])

    respond_to do |format|
      if @socket_state.update_attributes(params[:socket_state])
        format.html { redirect_to(@socket_state, :notice => 'Socket state was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @socket_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /socket_states/1
  # DELETE /socket_states/1.xml
  def destroy
    @socket_state = SocketState.find(params[:id])
    @socket_state.destroy

    respond_to do |format|
      format.html { redirect_to(socket_states_url) }
      format.xml  { head :ok }
    end
  end
end
