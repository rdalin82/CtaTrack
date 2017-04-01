require_relative './minitest_helper'
class TestCtaTrack < Minitest::Test
  def test_stops_response
    config = YAML.load(File.open("config.yml"))
    @key = config['API KEY']
    CtaTrack::API.apikey = @key
    response = CtaTrack::API.stops({:route=>78, :direction=>"Eastbound"})
    stops = response["bustime-response"]["stops"]
    assert_equal "11345", stops[0]["stpid"]
  end
end
