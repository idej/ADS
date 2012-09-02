class ChangeAdsTable < ActiveRecord::Migration
  def up
    remove_column :advertisements, :create_date
    remove_column :advertisements, :publicate_date
    add_column :advertisements, :publication_date, :date
  end

  def down
    add_column :advertisements, :create_date, :datetime
    add_column :advertisements, :publicate_date, :datetime
    remove_column :advertisements, :publication_date
  end
end
