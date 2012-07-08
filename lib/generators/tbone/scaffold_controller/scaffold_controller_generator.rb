require 'rails/generators'

module Tbone
  module Generators
    class ScaffoldControllerGenerator < ::Rails::Generators::NamedBase

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates simple T-bone generator"
      def create_controller
        template "controller.rb.erb", "app/controllers/#{plural_name}_controller.rb"  
      end
      private
      def class_name
        name
      end
      def plural_name
        name.underscore.pluralize
      end
    end
  end
end
