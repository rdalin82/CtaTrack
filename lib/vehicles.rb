require 'date'
require 'time'
module CtaTrack
  class Vehicles
    attr_reader :result
    def initialize(args)
      raise ArgumentError, "must enter api key" if API.apikey.nil?
      @result = {} 
      API.vehicles(args).root.xpath("vehicle").each do |node|
        time = node.xpath('tmstmp').text
        year = time[(0..3)].to_i
        month = time[(4..5)].to_i
        day = time[(6..7)].to_i
        hour = time[(9..10)].to_i
        minute = time[(12..13)].to_i
        
        @result[node.xpath('vid').text] = {
          :vid => node.xpath('vid').text.to_i,
          :lat => node.xpath('lat').text.to_f,
          :lon => node.xpath('lon').text.to_f,
          :des => node.xpath('des').text,
          :heading => node.xpath('hdg').text.to_i,
          :pattern_id => node.xpath('pid').text.to_i,
          :pattern_distance => node.xpath('pdist').text.to_i, 
          :rt => node.xpath('rt').text.to_i, 
          :delay => node.xpath('dly').text, 
          :timestamp => DateTime.new(year, month, day, hour, minute)
        }
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
end