#
# Control arduino using a socket
#

require 'rubygems'
require 'serialport'
require 'socket'                # Get sockets from stdlib
@sp = SerialPort.new("/dev/tty.usbserial-A700e08R", 9600)
@sp.sync = true
@sp.dtr = 0
@sp.dtr = 1
puts @sp.gets


server = TCPServer.open(2000)   # Socket to listen on port 2000
loop {                          # Servers run forever
  Thread.start(server.accept) do |client|
    #puts client.gets # Send the time to the client
    
    @sp.flush
    request = client.gets
    puts request
    @sp.write "#{request}\r"
    @sp.flush
    puts "OK"
    #sleep 1
    client.close                # Disconnect from the client
  end
}

@sp.close
