class AddActiveToPresets < ActiveRecord::Migration
  def self.up
    add_column :presets, :active, :boolean
  end

  def self.down
    remove_column :presets, :active
  end
end
