require 'active_record'

class User < ActiveRecord::Base
  :created_at
  :updated_at

  :username
  :password
  :is_admin
end
