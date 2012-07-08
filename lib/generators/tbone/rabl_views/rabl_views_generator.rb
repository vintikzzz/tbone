require 'rails/generators'

module Tbone
  module Generators
    class RablViewsGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates simple rabl views"
      def create_views
        template "index.rabl.erb", "app/views/#{plural_name}/index.json.rabl"  
        template "show.rabl.erb", "app/views/#{plural_name}/show.json.rabl"  
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
