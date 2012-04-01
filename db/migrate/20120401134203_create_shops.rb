class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :sid
      t.string 	:url
      t.string 	:title
      t.integer :saller_id

      t.timestamps
    end
  end
end
