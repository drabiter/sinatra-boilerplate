require 'factory_girl'
require './models/user'
require './models/product'

FactoryGirl.define do
  factory :normal_user, class: User do
    username 'test_user'
    password 'test_password'
    is_admin false
  end

  factory :product_a, class: Product do
    name 'Product A'
    brand 'Brand 1'
    company 'Company A1'
  end
end
