require "cta_track/version"
require 'yaml'
require 'nokogiri'
require 'open-uri'

module CtaTrack
  class API 
    attr_accessor :apikey
    @@apikey = nil
    @@baseurl = 'http://www.ctabustracker.com/bustime/api/v1/'
    def self.apikey=(apikey)
      @@apikey = apikey
    end
    def self.vehicles(args)
      vehicles_by_route(args[:routes]) if args[:routes]
    end
    def self.apikey
      return @@apikey
    end
    def self.vehicles_by_route(routes)
      Nokogiri::XML(open("#{@@baseurl}getvehicles/?key=#{@@apikey}&rt=#{requested_routes(routes)}"))
    end
    def self.routes(args={})
      Nokogiri::XML(open("#{@@baseurl}getroutes/?key=#{@@apikey}")) unless args[:routes]
      Nokogiri::XML(open("#{@@baseurl}getroutes/?key=#{@@apikey}&rt=#{requested_routes(args[:routes])}"))
    end

     
    def self.requested_routes(routes)
      if routes.respond_to?(:map)
        routes.map {|x| x.to_s + ","}.reduce(:+)[0...-1]
      else 
        routes
      end
    end
  end
end
