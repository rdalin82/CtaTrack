module CtaTrack
  class RouteFactory
    attr_reader :result
    def initialize(**args)
      raise ArgumentError, "must enter api key" if API.apikey.nil?
      @result = {} 
      API.routes.root.xpath("route").each do |node|
        @result[node.xpath('rt').text] = Route.new({:number=> node.xpath('rt').text, :name=> node.xpath('rtnm').text})
      end
    end
  end
  class Route
    attr_reader :number, :name
    def initialize(args) 
      @number = args[:number]
      @name = args[:name]
    end
  end
end
