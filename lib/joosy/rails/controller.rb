module Joosy
  module Rails
    class ServeController < ActionController::Base
      def index
        @prefix = request.env['SCRIPT_NAME']
        layout  = 'joosy'
        layout << "/#{params[:application]}" if params[:application]

        render text: '', layout: layout
      end
    end
  end
end