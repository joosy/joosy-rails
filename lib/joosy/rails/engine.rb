require 'rails/engine'

module Joosy
  module Rails
    class Engine < ::Rails::Engine
      cattr_accessor :resources
      self.resources = []

      initializer 'joosy.extend.sprockets' do |app|
        Joosy.assets_paths.each{|p| app.assets.append_path p}
      end
    end
  end
end
