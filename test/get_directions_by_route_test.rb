require_relative './minitest_helper'
class TestCtaTrack < Minitest::Test
  def test_directions_response
    config = YAML.load(File.open("config.yml"))
    @key = config['API KEY']
    CtaTrack::API.apikey = @key
    request = CtaTrack::API.directions(78)
    directions = request['bustime-response']['directions']
    assert_includes directions, {"dir"=>"Eastbound"}
  end
end
