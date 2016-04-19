require "transitions"
require "transitions/graph"
require "graphviz_transitions/version"

module Transitions
  require "graphviz_transitions/railtie" if defined?(Rails)

  Machine.class_eval do
    def self.draw(class_names, options = {})
      raise ArgumentError, "At least one class must be specified" unless class_names && class_names.split(',').any?

      class_names.split(',').each do |class_name|
        klass = class_name.constantize

        graph = Transitions::Graph.new(class_name, options)

        klass.get_state_machine.states.each do |state|
          state.draw(graph)
        end

        klass.get_state_machine.events.values.each do |event|
          event.draw(graph)
        end
        graph.output
      end
    end
  end

  Transitions::State.class_eval do

    def draw(graph)
      node = graph.add_nodes(self.name.to_s.humanize, shape: final? ? "doublecircle" : "ellipse")
      graph.add_edge(graph.add_nodes("starting_state", shape: "point"), node) if initial?
    end

    def initial?
      false
      # @klass.aasm.initial_state == self.name
    end

    def final?
      false
    #   !@klass.aasm.events.any? do |event|
    #     event.transitions.any? do |transition|
    #       transition.from == self.name
    #     end
    #   end
    end
  end

  Transitions::Event.class_eval do
    def draw(graph)
      @transitions.each do |transition|
        graph.add_edge(transition.from.to_s.humanize, transition.to.to_s.humanize, label: name.to_s)
      end
    end
  end
end
