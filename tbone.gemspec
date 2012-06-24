# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tbone}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Pavel Tatarsky}]
  s.date = %q{2012-06-24}
  s.description = %q{Library for mixing together requirejs backbone and twitter bootstrap}
  s.email = %q{fazzzenda@mail.ru}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/assets/javascripts/backbone-rails.js.coffee",
    "app/assets/javascripts/collections/paginated.js.coffee",
    "app/assets/javascripts/helpers/alert_queue.js.coffee",
    "app/assets/javascripts/helpers/layout.js.coffee",
    "app/assets/javascripts/models/.gitkeep",
    "app/assets/javascripts/models/token.js.coffee",
    "app/assets/javascripts/tbone.js.coffee",
    "app/assets/javascripts/templates/.gitkeep",
    "app/assets/javascripts/templates/common/alert_message.jst.hamljs",
    "app/assets/javascripts/templates/common/confirm.jst.hamljs",
    "app/assets/javascripts/templates/common/pager.jst.hamljs",
    "app/assets/javascripts/views/.gitkeep",
    "app/assets/javascripts/views/common/alert_message_view.js.coffee",
    "app/assets/javascripts/views/common/alert_view.js.coffee",
    "app/assets/javascripts/views/common/confirm_view.js.coffee",
    "app/assets/javascripts/views/common/form_view.js.coffee",
    "app/assets/javascripts/views/common/pager_view.js.coffee",
    "app/assets/javascripts/views/tokens/show_view.js.coffee",
    "app/controllers/home_controller.rb",
    "app/controllers/tokens_controller.rb",
    "app/helpers/tbone_helper.rb",
    "app/views/home/index.html.haml",
    "app/views/tokens/show.json.rabl",
    "config/routes.rb",
    "lib/generators/tbone/install/install_generator.rb",
    "lib/generators/tbone/install/templates/application.json.rabl",
    "lib/generators/tbone/install/templates/requirejs.yml",
    "lib/tbone.rb",
    "lib/tbone/engine.rb",
    "test/helper.rb",
    "test/test_tbone.rb"
  ]
  s.homepage = %q{http://github.com/vintikzzz/tbone}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Library for mixing together requirejs backbone and twitter bootstrap}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

