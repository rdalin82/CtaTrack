module CtaTrack
  class Stops
    attr_reader :stops, :result
    def initialize(args)
      raise ArgumentError, "must enter api key" if API.apikey.nil? 
      @result = {}
      @stops = []
      API.stops(args).root.xpath("stop").each do |node|
        @result[node.xpath('stpid').text.to_i] = {
          :stpid => node.xpath("stpid").text.to_i,
          :stpnm => node.xpath("stpnm").text,
          :lat => node.xpath("lat").text.to_i, 
          :lon => node.xpath("lon").text.to_i
        }
        @stops << node.xpath("stpnm").text
      end
    end
    def keys 
      @result.keys
    end
    def method_missing(method_name, stop, *arguments, &block)
      @result[stop][method_name.to_sym]
    end
    def respond_to?(method_name, include_private=false)
      @result[@result.keys[0]].include?("#{method_name}".to_sym)
    end
  end
end
