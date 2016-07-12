require "cta_track/version"
require_relative "../config.yml"

module CtaTrack
  class API 
    def initialize(apikey)
      @apikey = apikey 
      @baseurl = ""
    end
  end
end
