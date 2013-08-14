module Joosy
  module SprocketsHelper
    def self.joosy_resources
      Joosy::Rails::Engine.resources.map do |namespace, resources
      predefined = {}
      filtered_resources.each do |namespace, resources|
        next unless resources && resources.size > 0
        joosy_namespace = namespace.to_s.camelize.split('::').join('.')
        predefined[joosy_namespace] = resources
      end
      predefined
    end
  end
end
