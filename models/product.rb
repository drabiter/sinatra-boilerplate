require 'active_record'

class Product < ActiveRecord::Base
  :created_at
  :updated_at

  :name
  :brand
  :company
end
