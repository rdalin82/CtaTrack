require_relative './minitest_helper'
require 'json'

class CtaTrackAPI < Minitest::Test
  def setup
    config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "r"))
    @key = config['API_KEY'] 
  end

  def test_it_will_have_an_api_key
    CtaTrack::API.apikey = "yo"
    assert CtaTrack::API
  end
  def test_key_will_not_be_default
    refute_equal "YOUR API KEY HERE", CtaTrack::API.new.apikey
  end
  def test_it_will_respond_to_vehicles
    CtaTrack::API.apikey = @key
    assert CtaTrack::API.vehicles(:routes=>[78, 82])
    assert CtaTrack::API.vehicles(:routes=>82)
    assert CtaTrack::API.vehicles(:routes=>92)
    assert CtaTrack::API.vehicles(:routes=>[22])
  end
  def test_it_will_respond_to_routes
    CtaTrack::API.apikey = @key
    assert CtaTrack::API.routes()
    assert CtaTrack::API.routes(:routes=>78)
    assert CtaTrack::API.routes(:routes=>[78, 82])
    puts CtaTrack::API.routes().class
  end    
end
