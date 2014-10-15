require './models/user'

module Sinatra
  module App
    module Routers
      module Login
        def self.get_login
          lambda do
            if authenticated?
              redirect to('/')
            else
              haml :login
            end
          end
        end

        def self.post_login
          lambda do
            @user = User.find_by(username: params[:username],
                                 password: params[:password])
            if @user.nil?
              redirect to('/login')
            else
              session[:username] = @user.username
              haml :index
            end
          end
        end

        def self.registered(app)

          app.get '/login', &get_login
          app.post '/login', &post_login
        end
      end
    end
  end
end
