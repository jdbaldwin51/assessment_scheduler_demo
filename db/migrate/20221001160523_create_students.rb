class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.references :program, null: false, foreign_key: true
      t.integer :start_date, null: false
      t.references :advisor, null: false, foreign_key: true
      t.integer :sle, null: false
      t.string :phone, null: false
      t.integer :attempt_number, null: false
      t.date :hesi_date
      t.integer :hesi_time

      t.timestamps
    end
  end
end
