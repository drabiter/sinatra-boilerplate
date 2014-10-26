class CreateProductTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.datetime :created_at
      t.datetime :updated_at

      t.string :name
      t.string :brand
      t.string :company
    end
  end
end
