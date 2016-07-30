require_relative './minitest_helper'

class CtaTrackJSON < Minitest::Test
  def setup
    config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "rb"))
    @key = config['API_KEY'] 
  end
  def test_it_will_respond_to_routes
    CtaTrack::API.apikey = @key
  end

  def test_it_will_will_return_type_of_json
    CtaTrack::API.apikey = @key
    result = Nokogiri::XML::Document
  end 
end
