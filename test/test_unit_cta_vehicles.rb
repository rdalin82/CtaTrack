# require_relative './minitest_helper'
#
# class CtaTrackAPI < Minitest::Test
#   def setup
#     config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "rb"))
#     @key = config['API_KEY']
#   end
#   def test_it_will_respond_to_vehicles
#     CtaTrack::API.apikey = @key
#     assert CtaTrack::API.vehicles(:routes=>[78, 82])
#     assert CtaTrack::API.vehicles(:routes=>82)
#     assert CtaTrack::API.vehicles(:routes=>92)
#     assert CtaTrack::API.vehicles(:routes=>[22])
#   end
#
#   def test_it_will_will_return_type_of_noko_xml
#     CtaTrack::API.apikey = @key
#     result = Nokogiri::XML::Document
#     assert_equal result, CtaTrack::API.vehicles(:routes=>[78, 82]).class
#     assert_equal result, CtaTrack::API.vehicles(:routes=>82).class
#     assert_equal result, CtaTrack::API.vehicles(:routes=>92).class
#     assert_equal result, CtaTrack::API.vehicles(:routes=>[22]).class
#   end
# end
