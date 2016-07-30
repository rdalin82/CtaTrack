module CtaTrack
  class Routes
    attr_reader :result
    def initialize(**args)
      raise ArgumentError, "must enter api key" if API.apikey.nil?
      @result = {} 
      API.routes.root.xpath("route").each do |node|
        @result[node.xpath('rt').to_sym] = {:number=> node.xpath('rt'), :name=> node.xpath('rtnm') }
      end
    end
  end
end
