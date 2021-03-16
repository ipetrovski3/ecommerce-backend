class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :town
      t.string :phone
      t.integer :qty, default: 1
      t.text :note
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
