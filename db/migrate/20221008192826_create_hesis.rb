class CreateHesis < ActiveRecord::Migration[7.0]
  def change
    create_table :hesis do |t|
      t.date :date, index: true
      t.integer :time, index: true

      t.timestamps
      
    end
  end
end
