module Sinatra
  module App
    module Helpers
      def authenticated?
        !(!session[:username])
      end
    end
  end
end
