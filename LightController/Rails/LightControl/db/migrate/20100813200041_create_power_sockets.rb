class CreatePowerSockets < ActiveRecord::Migration
  def self.up
    create_table :power_sockets do |t|
      t.string :name
      t.string :action

      t.timestamps
    end
  end

  def self.down
    drop_table :power_sockets
  end
end
