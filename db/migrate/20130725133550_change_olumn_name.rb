class ChangeOlumnName < ActiveRecord::Migration
  def up
    rename_column :secondary_users, :User_id, :user_id
  end

  def down
  end
end
