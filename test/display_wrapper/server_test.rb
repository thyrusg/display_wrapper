require 'minitest/autorun'
require '../../lib/server'

class TestServer < Minitest::Test

  def setup
    @test_server = Server.new
  end

  def teardown
    @test_server.stop
  end

  def test_default_port_1337
    assert_equal 1337, @test_server.server.addr[1]
  end

end
