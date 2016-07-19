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
  def test_it_will_respond_to_vehicles
    CtaTrack::API.apikey = @key
    assert CtaTrack::API.vehicles(:routes=>[78, 82])
    assert CtaTrack::API.vehicles(:routes=>82)
    assert CtaTrack::API.vehicles(:routes=>92)
    assert CtaTrack::API.vehicles(:routes=>[22])
  end
  def test_it_will_respond_to_routes
    CtaTrack::API.apikey = @key
    assert CtaTrack::API.routes()
    assert CtaTrack::API.routes(:routes=>78)
    assert CtaTrack::API.routes(:routes=>[78, 82])
  end

  def test_it_will_will_return_type_of_xml
    CtaTrack::API.apikey = @key
    result = Nokogiri::XML::Document
    assert_equal result, CtaTrack::API.vehicles(:routes=>[78, 82]).class
    assert_equal result, CtaTrack::API.vehicles(:routes=>82).class
    assert_equal result, CtaTrack::API.vehicles(:routes=>92).class
    assert_equal result, CtaTrack::API.vehicles(:routes=>[22]).class
    assert_equal result, CtaTrack::API.routes(:routes=>78).class
    assert_equal result, CtaTrack::API.routes(:routes=>[78, 82]).class
  end    
end
