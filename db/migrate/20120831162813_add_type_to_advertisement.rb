class AddTypeToAdvertisement < ActiveRecord::Migration
  def change
    add_column :advertisements, :type_id, :integer
  end
end
