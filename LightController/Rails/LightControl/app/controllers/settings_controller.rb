class SettingsController < ApplicationController
  def index
  end
  
  def show
    @setting = params[:id]
    
    @power_sockets = PowerSocket.all
    @presets = Preset.all
    
    
  end
end
