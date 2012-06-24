require 'rails/generators'

module Tbone
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs T-bone"
      def copy_requirejs_config
        copy_file "requirejs.yml", "config/requirejs.yml"
      end
      def copy_application_rabl_view
        copy_file "application.json.rabl", "app/views/application.json.rabl"
      end
    end
  end
end
