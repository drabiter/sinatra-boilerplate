module Sinatra
  module App
    module Routers
      module Login

        def self.registered app
          get_login = lambda do
            if is_authenticated?
              redirect to('/')
            else
              haml :login
            end
          end

          post_login = lambda do
            @user = User.find_by(username: params[:username],
                                 password: params[:password])
            if @user.nil?
              redirect to('/login')
            else
              session[:username] = @user.username
              haml :index
            end
          end

          app.get '/login', &get_login
          app.post '/login', &post_login
        end

      end
    end
  end
end
