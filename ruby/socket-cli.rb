require "socket"
begin
    server = TCPSocket.open("ruby", 12345)
    puts server.read
ensure
    server.close if server
end
