class PowerSocket < ActiveRecord::Base
  has_many :socket_states
  has_many :presets, :through => :socket_states
  
  def state=(state)
     s = TCPSocket.open('10.0.0.100', 2000)

     s.puts "#{self.action} #{state}"

     s.close               # Close the socket when done
     self.current_state = state
     self.save
  end
end
