require "cta_track/version"
require 'yaml'

module CtaTrack
  class API 
    attr_accessor :apikey
    def initialize
      config = YAML.load(File.open(File.expand_path("../../config.yml", __FILE__), "r"))
      @apikey = config['API_KEY'] 
      @baseurl = ""
    end
  end
end
