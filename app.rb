ENV['RACK_ENV'] ||= :development.to_s

require 'sinatra/base'
require 'sinatra/reloader'
require 'active_record'

require './config/environment'

require_relative 'helpers/helpers'
require_relative 'routers/index'
require_relative 'routers/login'
require_relative 'models/user'

class App < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :environment, ENV['RACK_ENV'].to_sym
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, 'views') }
  set :haml, :format => :html5

  enable :sessions

  helpers Sinatra::App::Helpers

  register Sinatra::App::Routers::Index
  register Sinatra::App::Routers::Login

  validate_login = lambda do
    if !is_authenticated? && request.path_info != '/login'
      halt "Access denied, please <a href='/login'>login</a>."
    end
  end

  before &validate_login

end
