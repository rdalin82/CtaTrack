require_relative './minitest_helper'

class CtaTrackAPI < Minitest::Test
  def setup
    config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "rb"))
    @key = config['API_KEY'] 
  end

  def test_it_will_have_an_api_key
    CtaTrack::API.apikey = "yo"
    assert_equal "yo", CtaTrack::API.apikey
  end
  def test_key_will_not_be_default
    refute_equal "YOUR API KEY HERE", CtaTrack::API.new.apikey
  end    
end
