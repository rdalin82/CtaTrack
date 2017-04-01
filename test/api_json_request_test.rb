require_relative './minitest_helper'

class TestCtaTrack < Minitest::Test
  def test_api_requests_should_return_hash_from_json
    config = YAML.load(File.open("config.yml"))
    @key = config['API KEY']
    request_string = "http://www.ctabustracker.com/bustime/api/v2/gettime?key=#{@key}&format=json"
    assert_equal Hash, CtaTrack::API.api_request(request_string).class
  end
  def test_api_requests_keys_for_get_time
    config = YAML.load(File.open("config.yml"))
    @key = config['API KEY']
    request_string = "http://www.ctabustracker.com/bustime/api/v2/gettime?key=#{@key}&format=json"
    request = CtaTrack::API.api_request(request_string)
    assert_equal ["bustime-response"], request.keys
    assert_equal ["tm"], request["bustime-response"].keys
  end
end
