require "cta_track/version"

module CtaTrack
  class Tracker
    def self.routes(route=nil) 
      API.routes
    end
    def self.predictions
    end
    def self.vehicles
    end
  end
end
