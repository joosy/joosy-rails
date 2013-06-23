require 'ejs'
require 'joosy/generators'

module Joosy
  module Generators
    class ApplicationGenerator < ::Rails::Generators::Base
      source_root Joosy.templates_path

      argument :name, :type => :string

      def create_files
        self.destination_root = ::Rails.root.join('app/assets/javascripts/').join(name)
        instructions = Joosy::Generators.pregenerate('project/base', [name])

        instructions.each do |i|
          case i[0]
          when 'file'
            create_file i[1]
          when 'copy'
            copy_file i[2], i[1]
          when 'template'
            source = File.expand_path(find_in_source_paths(i[2]))

            create_file i[1] do
              EJS.evaluate(File.read(source), i[3])
            end
          end
        end
      end
    end
  end
end