require_relative './minitest_helper'
class TestCtaTrack < Minitest::Test
  def test_routes_response
    config = YAML.load(File.open("config.yml"))
    @key = config['API KEY']
    CtaTrack::API.apikey = @key
    routes_response = CtaTrack::API.routes()
    routes = routes_response['bustime-response']['routes']
    assert_equal Array, routes.class
    assert_equal "1", routes[0]["rt"]
  end
end
