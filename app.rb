require 'sinatra/base'
require 'sinatra/reloader'
require 'active_record'

require './config/environment'

require './routers/index'
require './routers/login'
require './helpers/helpers'

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :environment, ENV['RACK_ENV'].to_sym
  set :root, File.dirname(__FILE__)
  set :views, proc { File.join(root, 'views') }
  set :haml, format: :html5

  enable :sessions

  helpers Sinatra::App::Helpers

  register Sinatra::App::Routers::Index
  register Sinatra::App::Routers::Login

  validate_login = lambda do
    if !authenticated? && request.path_info != '/login'
      halt "Access denied, please <a href='/login'>login</a>."
    end
  end

  before(&validate_login)
end
