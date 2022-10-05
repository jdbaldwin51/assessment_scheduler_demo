class CreateHesis < ActiveRecord::Migration[7.0]
  def change
    create_table :hesis do |t|
      t.date :date
      t.integer :time

      t.timestamps
    end
  end
end
