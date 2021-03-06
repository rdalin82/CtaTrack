require "cta_track/version"
require 'yaml'
require 'json'
require 'nokogiri' #remove soon?
require 'open-uri'

module CtaTrack
  class API
    attr_accessor :apikey
    @@apikey = nil
    @@baseurl = 'http://www.ctabustracker.com/bustime/api/v2/'

    def self.apikey
      return @@apikey
    end

    def self.apikey=(apikey)
      @@apikey = apikey
    end

    def self.api_request(request)
      JSON.parse(open(request+"&format=json").read)
    end

    def self.routes()
      api_request("#{@@baseurl}getroutes/?key=#{@@apikey}")
    end

    def self.requested_routes(routes)
      if routes.respond_to?(:map)
        routes.map {|x| x.to_s + ","}.reduce(:+)[0...-1]
      else
        routes.to_s
      end
    end

    def self.vehicles(args)
      raise ArgumentError, "must include a :routes" unless args[:routes]
      vehicles_by_route(args[:routes]) if args[:routes]
    end

    def self.vehicles_by_route(routes)
      api_request("#{@@baseurl}getvehicles/?key=#{@@apikey}&rt=#{requested_routes(routes)}")
    end

    def self.directions(route)
      api_request("#{@@baseurl}getdirections?key=#{@@apikey}&rt=#{route}")
    end
    def self.stops(args)
      api_request("#{@@baseurl}getstops?key=#{@@apikey}&rt=#{args[:route]}&dir=#{args[:direction]}")
    end

    def self.predictions(**args)
      if args[:routes] && args[:stopId]
        api_request("#{@@baseurl}getpredictions?key=#{@@apikey}&rt=#{requested_routes(args[:routes])}&stpid=#{args[:stopId]}")
      else
        raise new ArgumentError
      end
    end
  end
end
