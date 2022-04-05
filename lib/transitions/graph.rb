require "graphviz"

module Transitions
  class Graph < ::GraphViz
    def initialize(class_name, options = {})
      options = {path: '.'}.merge(options)

      if active_support_less_than_version_5?
        file_name = "#{class_name.parameterize('_')}_transitions.png"
      else
        file_name = "#{class_name.parameterize(separator: '_')}_transitions.png"
      end

      @file_path = File.join(options[:path], file_name)

      super(:G)
    end

    def output
      super png: @file_path
    end

    private

    def active_support_less_than_version_5?
      ActiveSupport.version < Gem::Version.new('5')
    end
  end
end
