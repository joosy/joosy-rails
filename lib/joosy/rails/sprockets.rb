module Joosy
  module Rails
    module Sprockets
      module Asset
        def dependencies_with_sizes
          dependencies = to_a.map do |dependency|
            [dependency.logical_path, dependency.to_s.length]
          end

          Hash[*dependencies.flatten]
        end
      end
    end
  end
end