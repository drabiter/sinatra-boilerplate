class DropTables < ActiveRecord::Migration
  def up
    drop_table :users if table_exists? :users
    drop_table :products if table_exists? :products
  end

  def table_exist?(table)
    ActiveRecord::Base.connection.table_exists? table
  end
end
