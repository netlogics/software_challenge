class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false, index: true
      t.timestamps
    end
  end
end
