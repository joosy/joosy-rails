require 'sugar-rails'
require 'jquery-form-rails'
require 'joosy'

require 'joosy/rails/version'
require 'joosy/rails/sprockets'
require 'joosy/rails/engine'

module Joosy
  module Rails
    # def self.resources(namespaces=nil)
    #   predefined = {}
    #   filtered_resources = Joosy::Rails::Engine.resources
    #   if namespaces
    #     namespaces = Array.wrap namespaces
    #     filtered_resources = filtered_resources.select{|key, _| namespaces.include? key }
    #   end
    #   filtered_resources.each do |namespace, resources|
    #     next unless resources && resources.size > 0
    #     joosy_namespace = namespace.to_s.camelize.split('::').join('.')
    #     predefined[joosy_namespace] = resources
    #   end
    #   predefined
    # end
  end
end