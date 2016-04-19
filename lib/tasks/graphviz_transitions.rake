namespace :transitions do
  desc "Draws Transitions states using GraphViz (options: CLASS=User,Vehicle; TARGET=/folder/path ; ORIENTATION=portrait;)"
  task draw: :environment do
    options = {}
    options[:path]        = ENV['TARGET'] if ENV['TARGET']
    options[:orientation] = ENV['ORIENTATION'] if ENV['ORIENTATION']

    Transitions::Machine.draw(ENV['CLASS'], options)
  end
end