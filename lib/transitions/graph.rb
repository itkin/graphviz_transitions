require "graphviz"

module Transitions
  class Graph < ::GraphViz
    def initialize(class_name, options = {})
      options = {path: '.'}.merge(options)

      @file_path = File.join(options[:path], "#{class_name.parameterize(separator: '_')}_transitions.png")
      super(:G)
    end

    def output
      super png: @file_path
    end
  end
end
