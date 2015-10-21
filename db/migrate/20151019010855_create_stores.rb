class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :account, index: true
      t.string :name, null: false, index: true
      t.string :phone

      t.timestamps
    end
  end
end
