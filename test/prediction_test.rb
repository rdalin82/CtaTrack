require_relative './minitest_helper'
class TestCtaTrack < Minitest::Test
  def test_predictions_response
    config = YAML.load(File.open("config.yml"))
    @key = config['API KEY']
    CtaTrack::API.apikey = @key
    request = CtaTrack::API.predictions({:routes=>78, :stopId=>11345})
    predictions = request["bustime-response"]["prd"]
    assert_includes predictions[0].keys, "tmstmp"
  end
end
