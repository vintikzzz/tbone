require 'rails/generators'

module Tbone
  module Generators
    class ScaffoldBackboneRouterGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator generates simple T-bone router"
      def create_router
        template "router.coffee.erb", "app/assets/javascripts/routers/#{plural_name}_router.js.coffee"  
      end
      def create_views
        template "new_view.coffee.erb", "app/assets/javascripts/views/#{plural_name}/new_view.js.coffee"  
        template "edit_view.coffee.erb", "app/assets/javascripts/views/#{plural_name}/edit_view.js.coffee"  
        template "show_view.coffee.erb", "app/assets/javascripts/views/#{plural_name}/show_view.js.coffee"  
        template "index_view.coffee.erb", "app/assets/javascripts/views/#{plural_name}/index_view.js.coffee"  
        template "object_view.coffee.erb", "app/assets/javascripts/views/#{plural_name}/#{single_name}_view.js.coffee"  
      end
      def create_templates
        template "form.hamljs.erb", "app/assets/javascripts/templates/#{plural_name}/form.jst.hamljs"  
        template "index.hamljs.erb", "app/assets/javascripts/templates/#{plural_name}/index.jst.hamljs"  
        template "show.hamljs.erb", "app/assets/javascripts/templates/#{plural_name}/show.jst.hamljs"  
        template "object.hamljs.erb", "app/assets/javascripts/templates/#{plural_name}/#{single_name}.jst.hamljs"  
        template "confirm.hamljs.erb", "app/assets/javascripts/templates/#{plural_name}/confirm.jst.hamljs"  
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
