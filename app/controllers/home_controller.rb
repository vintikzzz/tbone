class HomeController < ApplicationController
  def index
    path = File.expand_path('config/tbone_params.rb', Rails.root)
    if File.exists? path
      params = eval(File.open(path).read)
      Tbone.configure do |c|
        c.add_params params
      end
    end
  end
  def render_bootstrap_data(template)
    old_format = lookup_context.rendered_format
    lookup_context.rendered_format = :json
    data = Rabl.render(nil, template, :view_path => 'app/views', :format => :hash, :scope => self.view_context)
    lookup_context.rendered_format = old_format
    data
  end
end
