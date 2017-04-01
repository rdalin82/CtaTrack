require_relative './minitest_helper'
class TestCtaTrack < Minitest::Test
  def test_predictions_response
    config = YAML.load(File.open("config.yml"))
    @key = config['API KEY']
    CtaTrack::API.apikey = @key
  end
end
