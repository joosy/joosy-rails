require 'sprockets'
require 'execjs'
require 'ejs'

module Joosy
  module Generators
    def self.pregenerate(generator, arguments)
      environment = Sprockets::Environment.new
      environment.append_path Joosy.generators_path

      source = environment['base.js'].to_s
      source << environment["#{generator}.js"].to_s
      source << <<-JS
        Generator.prototype.version = function(){return '#{Joosy::VERSION}'};
      JS

      ExecJS.compile(source).eval("new Generator(#{arguments.to_json}).generate()")
    end
  end
end