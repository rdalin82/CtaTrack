require_relative './minitest_helper'

class CtaTrackAPI < Minitest::Test
  def setup
    config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "rb"))
    @key = config['API_KEY'] 
  end

  def test_it_will_respond_to_predictions
    CtaTrack::API.apikey = @key
    assert CtaTrack::API.predictions({:routes=>78, :stopId=>11389})
    assert CtaTrack::API.predictions({:routes=>[78], :stopId=>11389})
  end

  def test_it_will_return_noko_xml
    CtaTrack::API.apikey = @key
    result = Nokogiri::XML::Document
    assert_equal result, CtaTrack::API.predictions({:routes=>78, :stopId=>11389}).class
    assert_equal result, CtaTrack::API.predictions({:routes=>[78], :stopId=>11389}).class
  end

  def test_it_will_have_time
    CtaTrack::API.apikey = @key
    request = CtaTrack::API.predictions({:routes=>78, :stopId=>11389})
    assert_equal Fixnum, request.xpath("//prdtm").inner_text.to_i.class
  end
end