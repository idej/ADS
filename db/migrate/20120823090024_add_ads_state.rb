class AddAdsState < ActiveRecord::Migration
  def up
    remove_column :advertisements, :life_cycle
    add_column :advertisements, :state, :string
  end

  def down
    remove_column :advertisements, :state
    add_column :advertisements, :life_cycle, :string
  end
end
