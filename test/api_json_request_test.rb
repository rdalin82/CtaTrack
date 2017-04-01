require_relative './minitest_helper'

class TestCtaTrack < Minitest::Test
  def test_api_requests_should_return_hash_from_json
    config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "rb"))
    @key = config['API_KEY']
    request_string = "http://www.ctabustracker.com/bustime/api/v2/gettime?key=#{@key}&format=json"
    assert Hash, CtaTrack::API.api_request(request_string).class
  end
  def test_api_requests_keys_for_get_time
    config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "rb"))
    @key = config['API_KEY']
    request_string = "http://www.ctabustracker.com/bustime/api/v2/gettime?key=#{@key}&format=json"
    request = CtaTrack::API.api_request(request_string)
    assert ["bustime-response"], request.keys
    assert ["tm"], request["bustime-response"].keys
  end

end
