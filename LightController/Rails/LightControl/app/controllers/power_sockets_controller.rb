class PowerSocketsController < ApplicationController
 # require 'serialport'
  # GET /power_sockets
  # GET /power_sockets.xml
  def index
    @power_sockets = PowerSocket.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @power_sockets }
    end
  end
  
  def rename
     @power_socket = PowerSocket.all
     for power_socket in @power_socket
       power_socket.name = params["power_socket_#{power_socket.id}"]
       power_socket.save
     end
     respond_to do |format|
       format.html { redirect_to(socket_settings_url) }
       format.xml  { render :xml => @power_socket }
     end
   end
  
  def enable
    @power_socket = PowerSocket.find(params[:id])
    
    @power_socket.state = 1
    
    respond_to do |format|
      format.html {redirect_to(power_sockets_url)}
      format.mobile {render :nothing}
    end
  end

  def disable
     @power_socket = PowerSocket.find(params[:id])

     @power_socket.state = 0
    
     respond_to do |format|
       format.html {redirect_to(power_sockets_url)}
       format.mobile {render :nothing}
     end
   end

  # GET /power_sockets/1
  # GET /power_sockets/1.xml
  def show
    @power_socket = PowerSocket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @power_socket }
    end
  end

  # GET /power_sockets/new
  # GET /power_sockets/new.xml
  def new
    @power_socket = PowerSocket.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @power_socket }
    end
  end

  # GET /power_sockets/1/edit
  def edit
    @power_socket = PowerSocket.find(params[:id])
  end

  # POST /power_sockets
  # POST /power_sockets.xml
  def create
    @power_socket = PowerSocket.new(params[:power_socket])

    respond_to do |format|
      if @power_socket.save
        format.html { redirect_to(@power_socket, :notice => 'Power socket was successfully created.') }
        format.mobile { redirect_to(power_sockets_url, :notice => 'Power socket was successfully created.') }
        format.xml  { render :xml => @power_socket, :status => :created, :location => @power_socket }
      else
        format.html { render :action => "new" }
        format.mobile { render :action => "new" }
        format.xml  { render :xml => @power_socket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /power_sockets/1
  # PUT /power_sockets/1.xml
  def update
    @power_socket = PowerSocket.find(params[:id])

    respond_to do |format|
      if @power_socket.update_attributes(params[:power_socket])
        format.html { redirect_to(@power_socket, :notice => 'Power socket was successfully updated.') }
        format.mobile { redirect_to(@power_socket, :notice => 'Power socket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @power_socket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /power_sockets/1
  # DELETE /power_sockets/1.xml
  def destroy
    @power_socket = PowerSocket.find(params[:id])
    @power_socket.destroy

    respond_to do |format|
      format.html { redirect_to(power_sockets_url) }
      format.xml  { head :ok }
    end
  end
end
