class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
