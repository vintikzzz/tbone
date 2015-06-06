require 'rails'
module Tbone
  mattr_accessor :js_prefix
  class Engine < Rails::Engine
    initializer "tbone" do |app|
      conf = {
        'shim' => {
          'backbone' => {
            'deps' => ['underscore', 'jquery'],
            'exports' => 'Backbone'
          },
          'backbone_rails_sync' => ['backbone'],
          'tbone_backbone_datalink' => ['backbone'],
          'backbone-rails' => ['backbone', 'backbone_rails_sync', 'tbone_backbone_datalink']
        },
        'wrap' => true
      }
      jquery_plugs = [
        'transition',
        'alert',
        'modal',
        'dropdown',
        'scrollspy',
        'tab',
        'tooltip',
        'popover',
        'button',
        'collapse',
        'carousel',
        'affix'
      ]
      conf['paths'] = {}
      jquery_plugs.each { |e|
          conf['paths']["bootstrap_#{e}"] = "#{Tbone.js_prefix}#{e}"
          conf['shim']["bootstrap_#{e}"] = ['jquery']
      }
      conf['shim']['bootstrap_popover'] << 'bootstrap_tooltip'
      conf['shim']['bootstrap'] ||= []
      conf['shim']['bootstrap'].concat jquery_plugs.map { |e| "bootstrap_#{e}" }
      app.config.requirejs.user_config.deeper_merge!(conf)
      Rabl.configure do |config|
        config.include_json_root = false
      end
    end
  end
end
