require 'active_support/all'
require 'sprockets'
require 'execjs'

module Joosy
  module Generators
    class Base < ::Rails::Generators::Base
      no_tasks do
        class <<self
          attr_accessor :kind
        end

        alias_method :erb_template, :template
        
        def template(source, destination=nil, config={})
          destination ||= source
          source  = File.expand_path(find_in_source_paths(source.to_s))
          context = instance_eval('binding')
    
          create_file destination, nil, config do
            self.class.ejs ::File.read(source), @options
          end
        end
      end

      protected

      def self.sprockets
        return @sprockets if @sprockets

        @sprockets = Sprockets::Environment.new
        @sprockets.append_path File.expand_path('../../../../../vendor/', __FILE__)
        @sprockets
      end

      def self.ejs(template, data)
        ExecJS.compile(sprockets['ejs'].to_s).eval("ejs.compile(#{template.to_json})(#{data.to_json})")
      end

      def self.source_root
        Joosy.templates_path
      end
    end

    class Entity < Base
      argument :name, type: :string
      argument :application, type: :string, optional: true

      def create_files
        @options = {
          'name'      => name,
          'namespace' => name.split('/')[0..-2].map(&:camelize).join('/'),
          'view'      => name.split('/').last.underscore,
          'klass'     => name.split('/').last.camelize
        }

        directory self.class.kind, Pathname.new('app/assets/javascripts/').join(application || '')
      end
    end
  end
end