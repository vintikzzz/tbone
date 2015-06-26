class HomeController < ApplicationController
  def index
  end
  def render_bootstrap_data(template)
    old_format = lookup_context.rendered_format
    lookup_context.rendered_format = :json
    data = Rabl.render(nil, template, :view_path => 'app/views', :format => :hash, :scope => self.view_context)
    lookup_context.rendered_format = old_format
    data
  end
end
