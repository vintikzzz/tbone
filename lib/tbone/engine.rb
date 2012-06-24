require 'rails'
module Tbone
  class Engine < Rails::Engine
    initializer "tbone" do |app|
      conf = {
        'shim' => {
          'backbone' => {
            'deps' => ['underscore', 'jquery'],
            'exports' => 'Backbone'
          },
          'backbone_rails_sync' => ['backbone'],
          'backbone_datalink' => ['backbone'],
          'backbone-rails' => ['backbone', 'backbone_rails_sync', 'backbone_datalink']
        },
        'wrap' => true
      }
      jquery_plugs = [
        'bootstrap-transition',
        'bootstrap-alert',
        'bootstrap-modal',
        'bootstrap-dropdown',
        'bootstrap-scrollspy',
        'bootstrap-tab',
        'bootstrap-tooltip',
        'bootstrap-popover',
        'bootstrap-button',
        'bootstrap-collapse',
        'bootstrap-carousel',
        'bootstrap-typeahead'
      ]
      conf['paths'] = {}
      jquery_plugs.each { |e| 
          conf['paths'][e] = "twitter/bootstrap/#{e}"
          conf['shim'][e] = ['jquery']
      }
      conf['shim']['bootstrap-popover'] << 'bootstrap-tooltip'
      conf['shim']['bootstrap'] = jquery_plugs
      app.config.requirejs.user_config.deep_merge!(conf)
    end
  end
end
