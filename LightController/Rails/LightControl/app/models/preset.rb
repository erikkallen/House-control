class Preset < ActiveRecord::Base
  has_many :socket_states, :dependent => :destroy
  has_many :power_sockets, :through => :socket_states
end
