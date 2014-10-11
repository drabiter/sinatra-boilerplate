module Sinatra
  module App
    module Helpers

      def is_authenticated?
        return !!session[:username]
      end

    end
  end
end
