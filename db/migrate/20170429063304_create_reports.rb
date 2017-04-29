class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.decimal :total

      t.timestamps
    end
  end
end
