require 'action_dispatch/routing/mapper'

module ActionDispatch::Routing
  class Mapper
    module Resources
      class JoosyResource
        def initialize(context)
          @context = context
        end

        def method_missing(name, *args, &block)
          @context.send(name, *args, &block)
        end

        def resources(*args, &block)
          @context.resources(*args) do
            scope = @context.instance_eval { @scope }
            Joosy::Rails::Engine.resources << "#{scope[:path]}/#{scope[:scope_level_resource].path}"
            @context.joosy_resources(&block)
          end
        end
      end

      def joosy_resources(&block)
        JoosyResource.new(self).instance_eval(&block) if block_given?
      end
    end

    def joosy(route, options={})
      extender = route.last == '/' ? '(*x)' : '(/*x)'

      get route,
        controller:   options[:controller] || 'joosy/rails/serve',
        action:       options[:action] || 'index',
        as:           (options[:application] ? "joosy_#{options[:application]}" : "joosy"),
        defaults:     {route: route, application: options[:application]},
        anchor:       false,
        format:       false
    end
  end
end
