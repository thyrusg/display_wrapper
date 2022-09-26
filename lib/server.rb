require 'socket'
require_relative "./wrapper"
require 'cgi'

class Server
  attr_reader :server

  def initialize(port = 1337)
    @server = TCPServer.new port
  end

  def start
    puts "Server started" if @server
    loop do
      client = @server.accept
      request = parse_request(client.gets)
      #TODO: Add validation of request params
      params = parse_params(request[:path])
      if params
        DisplayWrapper.execute(text: params["text"].first, title: params["title"].first,
                               subtitle: params["subtitle"].first, sound: params["sound"].first)
      end
      client.write "Request Processed"
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

  def parse_params(url_params)
    # This strips the leading /? from the path
    url_params = url_params[2..-1]
    CGI.parse(url_params)
  end
end

if __FILE__ == $0
  Server.new.start
end
