require 'socket'

class Server
  attr_reader :server

  def initialize(port = 1337)
    @server = TCPServer.new port
  end

  def start
    puts "Server started on port 1337" if @server
    loop do
      client = @server.accept
      request = parse_request(client.gets)
      puts request
      client.close
    end
  end

  def stop
    puts "Shutting down server"
    @server.close
  end

  private

  def parse_request(request)
    method, path, protocol = request.split(" ")
    {method: method, path: path, protocol: protocol}
  end
end
