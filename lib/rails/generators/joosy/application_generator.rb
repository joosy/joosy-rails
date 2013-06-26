require_relative './base'

module Joosy
  module Generators
    class ApplicationGenerator < Base
      argument :name, type: :string, optional: true

      def create_application
        dependencies = <<-COFFEE
#= require jquery
#= require jquery.form
#= require sugar
#= require hamlcoffee
        COFFEE

        self.destination_root = ::Rails.root.join('app/assets/javascripts/').join(name || '')
        run Joosy::Generators.pregenerate('project/base', {name: name, dependencies: dependencies})
      end

      def create_bindings
        self.destination_root = ::Rails.root

        if !name
          index = ::Rails.root.join('app/assets/javascripts/application.js')

          if File.exists?(index)
            copy_file index, 'app/assets/javascripts/application.bak'
            remove_file index
          end
        end

        layout = 'joosy'
        layout << "/#{name}" if name
        template File.expand_path('../templates/layout.html.erb', __FILE__), "app/views/layouts/#{layout}.html.erb"

        application = name ? ", application: '#{name}'" : ''
        route "joosy '/'#{application}"
      end
    end
  end
end