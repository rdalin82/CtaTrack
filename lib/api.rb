require "cta_track/version"
require 'yaml'
require 'json'
require 'nokogiri' #remove soon?
require 'open-uri'

module CtaTrack
  class API
    attr_accessor :apikey
    @@apikey = nil
    @@baseurl = 'http://www.ctabustracker.com/bustime/api/v1/'

    def self.apikey
      return @@apikey
    end

    def self.apikey=(apikey)
      @@apikey = apikey
    end

    def self.api_request(request)
      JSON.parse(open(request+"&format=json").string)
    end

    def self.routes()
      nokorequest("#{@@baseurl}getroutes/?key=#{@@apikey}")
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
      nokorequest("#{@@baseurl}getvehicles/?key=#{@@apikey}&rt=#{requested_routes(routes)}")
    end



    def self.directions(route)
      nokorequest("#{@@baseurl}getdirections?key=#{@@apikey}&rt=#{route}")
    end
    def self.stops(args)
      nokorequest("#{@@baseurl}getstops?key=#{@@apikey}&rt=#{args[:route]}&dir=#{args[:direction]}")
    end
  end

  def self.predictions(**args)
    if args[:routes] && args[:stopId]
      nokorequest("#{@@baseurl}getpredictions?key=#{@@apikey}&rt=#{requested_routes(args[:routes])}&stpid=#{args[:stopId]}")
    else
      raise new ArgumentError
    end
  end
end
