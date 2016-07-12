require "cta_track/version"
require 'yaml'
require 'nokogiri'
require 'open-uri'

module CtaTrack
  class API 
    attr_accessor :apikey
    def initialize
      config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "r"))
      @apikey = config['API_KEY'] 
      @baseurl = "http://www.ctabustracker.com/bustime/api/v1/"
      #http://www.ctabustracker.com/bustime/api/v1/getvehicles?key=
      #http://www.ctabustracker.com/bustime/api/v1/getpredictions?key=
    end
    def vehicles(args)
      vehicles_by_route(args[:routes]) if args[:routes]
    end

    private 
    def vehicles_by_route(routes)
      routes.respond_to?(:map) ? requested_routes = routes.map {|x| x.to_s + ","}.reduce(:+)[0...-1] : requested_routes = routes
      Nokogiri::XML(open("#{@baseurl}getvehicles/?key=#{apikey}&rt=#{requested_routes}"))
    end
  end
end
