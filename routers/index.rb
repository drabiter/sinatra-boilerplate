module Sinatra
  module App
    module Routers
      module Index
        def self.registered(app)
          get_index = lambda do
            @user ||= User.find_by! username: session[:username]
            haml :index
          end

          app.get '/', &get_index
        end
      end
    end
  end
end
