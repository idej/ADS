class AddUserIdInAdvertisement < ActiveRecord::Migration
  def up
    add_column :advertisements, :user_id, :integer
  end

  def down
    remove_column :advertisements, :user_id
  end
end
