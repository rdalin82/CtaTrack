require_relative './minitest_helper'
class TestCtaTrack < Minitest::Test
  def test_vehicles_response
    config = YAML.load(File.open("config.yml"))
    @key = config['API KEY']
    CtaTrack::API.apikey = @key
    request = CtaTrack::API.vehicles_by_route([78, 82])
    vehicles = request['bustime-response']
    refute_nil vehicles["vehicle"][0]["vid"]
  end
end
