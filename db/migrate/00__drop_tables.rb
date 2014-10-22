class DropTables < ActiveRecord::Migration
  def up
    drop_table :users if ActiveRecord::Base.connection.table_exists? :users
    drop_table :products if ActiveRecord::Base.connection.table_exists? :products
  end
end
