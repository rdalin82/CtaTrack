module CtaTrack
  class Directions
    def initialize(args)
      raise ArgumentError, "must enter api key" if API.apikey.nil? 
      @result = []
      API.directions(args).root.xpath("dir").each do |node|
        @result << node.text
      end
    end
    def dir
      @result
    end
  end
end
