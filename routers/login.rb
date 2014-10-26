require './models/user'

module Sinatra
  module App
    module Routers
      module Login
        def self.login_get
          lambda do
            if authenticated?
              redirect to('/')
            else
              haml :login
            end
          end
        end

        def self.login_post
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
          app.get '/login', &login_get
          app.post '/login', &login_post
        end
      end
    end
  end
end
