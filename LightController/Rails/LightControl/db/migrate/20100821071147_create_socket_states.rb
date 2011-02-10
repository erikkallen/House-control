class CreateSocketStates < ActiveRecord::Migration
  def self.up
    create_table :socket_states do |t|
      t.integer :preset_id
      t.integer :power_socket_id
      t.integer :state

      t.timestamps
    end
  end

  def self.down
    drop_table :socket_states
  end
end
