class CreateGuestUsers < ActiveRecord::Migration
  def change
    create_table :guest_users do |t|
      t.string :email

      t.timestamps
    end
  end
end
