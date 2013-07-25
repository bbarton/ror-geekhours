class CreateSecondaryUsers < ActiveRecord::Migration
  def change
    create_table :secondary_users do |t|
      t.string :name
      t.string :email
      t.references :User

      t.timestamps
    end
    add_index :secondary_users, :User_id
  end
end
