module GraphvizTransitions
  class Railtie < Rails::Railtie
    railtie_name :graphviz_transitions

    rake_tasks do
      load "tasks/graphviz_transitions.rake"
    end
  end
end
