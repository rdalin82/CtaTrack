module CtaTrack
  class Predictions
    attr_reader :result, :request
    def initialize(args)
      @result = {}
      request = API.predictions(args)
      puts request
      @request = request
      @result[:message] = request.root.xpath("error").xpath("msg").text
      request.root.xpath("prd").each do |node|
        time = node.xpath('tmstmp').text
        year = time[(0..3)].to_i
        month = time[(4..5)].to_i
        day = time[(6..7)].to_i
        hour = time[(9..10)].to_i
        minute = time[(12..13)].to_i

        @result[node.xpath('vid').text] = {
          :stpnm => node.xpath('stpnm').text,
          :stpid => node.xpath('stpid').text.to_i,
          :vid => node.xpath("vid").text.to_i,
          :dstp => node.xpath("dstp").text.to_i,
          :rt => node.xpath("rt").text,
          :rtdir => node.xpath("rtdir").text,
          :des => node.xpath("des").text,
          :prdtm => node.xpath("prdtm").text,
          :dly => node.xpath("dly").text,
          :timestamp => DateTime.new(year, month, day, hour, minute)
        }
      end
    end
    def message
      @result[:message]
    end

    def keys
      @result.keys
    end
    def method_missing(method_name, vid, *arguments, &block)
      @result[vid][method_name.to_sym]
    end
    def respond_to?(method_name, include_private = false)
      @result[@result.keys[0]].include?("#{method_name}".to_sym)
    end
  end
end
