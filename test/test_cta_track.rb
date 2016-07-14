require_relative './minitest_helper'

class TestCtaTrack < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CtaTrack::VERSION
  end
end
