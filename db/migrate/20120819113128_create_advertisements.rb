class CreateAdvertisements < ActiveRecord::Migration
  def up
    create_table :advertisements do |t|
      t.text :content
      t.datetime :create_date
      t.datetime :publicate_date
      t.string :phone_number
      t.string :life_cycle
      t.timestamps
    end
  end

  def down
    drop_table :advertisements
  end
end
