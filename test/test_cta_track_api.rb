require_relative './minitest_helper'

class CtaTrackAPI < Minitest::Test
  def test_it_will_initialize
    assert CtaTrack::API.new
  end
  def test_it_will_have_an_api_key
    assert CtaTrack::API.new.apikey 
  end
  def test_key_will_not_be_default
    refute_equal "YOUR API KEY HERE", CtaTrack::API.new.apikey
  end
end
