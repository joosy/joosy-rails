require_relative './base'

module Joosy
  module Generators
    class WidgetGenerator < Base
      argument :name, type: :string
      argument :project, type: :string, optional: true

      def create_files
        self.destination_root = ::Rails.root.join('app/assets/javascripts/').join(project || '')
        run Joosy::Generators.pregenerate('widget', {name: name})
      end
    end
  end
end