class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :minimum_sle
      t.integer :minimum_hesi
      t.integer :minimum_hesi_section

      t.timestamps
    end
  end
end
