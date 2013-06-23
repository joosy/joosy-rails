require 'joosy/generators'
require 'ejs'

module Joosy
  module Generators
    class Base < ::Rails::Generators::Base
      protected

      def self.source_root
        Joosy.templates_path
      end

      def run(instructions)
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