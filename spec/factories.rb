require 'factory_girl'
require File.dirname(__FILE__) + '/../models/user'

FactoryGirl.define do
  factory :normal_user, class: User do
    username 'test_user'
    password 'test_password'
    is_admin false
  end
end
