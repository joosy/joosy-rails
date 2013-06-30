require 'rails/engine'

module Joosy
  module Rails
    class Engine < ::Rails::Engine
      initializer 'joosy.extend.sprockets' do |app|
        Joosy.assets_paths.each{|p| app.assets.append_path p}
      end
    end
  end
end

module ActionDispatch::Routing
  class Mapper
    def joosy(route, options={})
      extender = route.last == '/' ? '(*x)' : '(/*x)'

      match route,
        controller:   options[:controller] || 'joosy/rails/serve',
        action:       options[:action] || 'index',
        via:          :get, 
        as:           (options[:application] ? "joosy_#{options[:application]}" : "joosy"),
        defaults:     {route: route, application: options[:application]},
        anchor:       false,
        format:       false
    end
  end
end