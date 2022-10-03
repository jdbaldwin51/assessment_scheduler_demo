class CreateHesis < ActiveRecord::Migration[7.0]
  def change
    create_table :hesis do |t|

      t.timestamps
    end
  end
end
