class AddCurrentStateToPowerSockets < ActiveRecord::Migration
  def self.up
    add_column :power_sockets, :current_state, :integer
  end

  def self.down
    remove_column :power_sockets, :current_state
  end
end
