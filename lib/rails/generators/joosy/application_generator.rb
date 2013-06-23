require_relative './base'

module Joosy
  module Generators
    class ApplicationGenerator < Base
      argument :name, type: :string, optional: true

      def create_files
        dependencies = <<-COFFEE
#= require jquery
#= require jquery.form
#= require sugar
#= require hamlcoffee
        COFFEE

        self.destination_root = ::Rails.root.join('app/assets/javascripts/').join(name || '')
        run Joosy::Generators.pregenerate('project/base', {name: name, dependencies: dependencies})
      end
    end
  end
end