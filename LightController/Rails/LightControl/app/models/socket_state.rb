class SocketState < ActiveRecord::Base
belongs_to :preset
belongs_to :power_socket
end
