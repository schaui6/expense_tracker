class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.text :description
      t.string :date_time
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
