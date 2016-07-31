module CtaTrack
  class Routes
    attr_reader :result
    def initialize(**args)
      raise ArgumentError, "must enter api key" if API.apikey.nil?
      @result = {} 
      API.routes.root.xpath("route").each do |node|
        @result[node.xpath('rt').text] = {:number=> node.xpath('rt').text, :name=> node.xpath('rtnm').text }
      end
    end
  end
end
