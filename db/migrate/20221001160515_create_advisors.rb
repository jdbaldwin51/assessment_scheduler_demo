class CreateAdvisors < ActiveRecord::Migration[7.0]
  def change
    create_table :advisors do |t|
      t.string :name
      t.string :email
      t.integer :invitation_code

      t.timestamps
    end
  end
end
