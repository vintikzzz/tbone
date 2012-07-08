require 'rails/generators'

module Tbone
  module Generators
    class BackboneModelGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates simple T-bone generator"
      def create_controller
        template "model.coffee.erb", "app/assets/javascripts/models/#{single_name}.js.coffee"  
        template "collection.coffee.erb", "app/assets/javascripts/collections/#{plural_name}.js.coffee"  
      end
      private
      def class_name
        name
      end
      def plural_name
        name.underscore.pluralize
      end
      def single_name
        name.underscore
      end
    end
  end
end
