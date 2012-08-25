class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.text :content
      t.datetime :create_date
      t.datetime :publicate_date
      t.string :phone_number
      t.string :life_cycle
      t.timestamps
    end
  end
end
