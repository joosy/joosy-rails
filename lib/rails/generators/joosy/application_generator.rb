require_relative './base'

module Joosy
  module Generators
    class ApplicationGenerator < Base
      argument :name, type: :string, optional: true

      def create_application
        dependencies = <<-COFFEE
#= require jquery
#= require jquery.form
#= require sugar-full
#= require hamlcoffee
        COFFEE

        @options = {
          'dependencies' => dependencies,
          'html5'        => true,
          'prefix'       => name || ''
        }

        directory 'application', Pathname.new('app/assets/javascripts/').join(name || '')
      end

      def create_bindings
        self.destination_root = ::Rails.root

        if !name
          index = ::Rails.root.join('app/assets/javascripts/application.js')

          if File.exists?(index)
            copy_file index, 'app/assets/javascripts/application.old.js'
            remove_file index
          end
        end

        layout = 'joosy'
        layout << "/#{name}" if name
        erb_template File.expand_path('../templates/layout.html.erb', __FILE__), "app/views/layouts/#{layout}.html.erb"

        application = name ? ", application: '#{name}'" : ''
        route "joosy '/#{name}'#{application}"
      end
    end
  end
end