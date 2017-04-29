class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.text :description
      t.date :date
      t.time :time
      t.decimal :amount, precision: 8, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
