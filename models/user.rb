class User
  include Mongoid::Document
  field :username
  field :password
  field :is_admin, type: Boolean
  field :_id, default: ->{ username }
end
