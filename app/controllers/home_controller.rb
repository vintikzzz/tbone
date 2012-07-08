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
end
