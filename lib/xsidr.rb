require "xsidr/version"
require "nokogiri"

module Xsidr
  class Xnode
    def initialize(content)
      @xnode = Nokogiri::XML(content)
    end

    def xpath_each (xpath)
      @xnode.xpath(xpath).each do |node|
        yield node
      end
    end

    def xpath_each_eval(xpath, statement)
      @xnode.xpath(xpath).each do |node|
        eval statement
      end
    end

    def to_xml
      @xnode.to_xml
    end

    def create(tag, attrs)
      node = Nokogiri::XML::Node.new(tag, @xnode)
      
      attrs.each do |key, value|
        node[key] = value
      end

      node
    end
  end
end

module Nokogiri
  module XML
    class Node
      def >> node_or_tags
        child().add_previous_sibling(node_or_tags)
      end
    end
  end
end

