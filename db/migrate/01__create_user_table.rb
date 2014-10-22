class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.datetime   :created_at
      t.datetime   :updated_at

      t.string :username
      t.string :password
      t.boolean :is_admin
    end
  end
end
