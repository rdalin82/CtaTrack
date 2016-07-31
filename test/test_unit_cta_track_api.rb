require_relative './minitest_helper'

class CtaTrackAPI < Minitest::Test
  def setup
    config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "rb"))
    @key = config['API_KEY'] 
  end

  def test_it_will_respond_to_routes
    CtaTrack::API.apikey = @key
    assert CtaTrack::API.routes()
    assert CtaTrack::API.routes()
    assert CtaTrack::API.routes()
  end

  def test_it_will_will_return_type_of_xml
    CtaTrack::API.apikey = @key
    result = Nokogiri::XML::Document
    assert_equal result, CtaTrack::API.routes().class
    assert_equal result, CtaTrack::API.routes().class
  end    
end