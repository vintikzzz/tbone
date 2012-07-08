require 'rails/generators'

module Tbone
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates simple T-bone router"
      def create_model
        generate "model #{class_name}"
      end
      def create_controller
        generate "tbone:scaffold_controller #{class_name}"
      end
      def create_rabl_views
        generate "tbone:rabl_views #{class_name}"
      end
      def create_backbone_model
        generate "tbone:backbone_model #{class_name}"
      end
      def create_router
        generate "tbone:scaffold_backbone_router #{class_name}"
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
