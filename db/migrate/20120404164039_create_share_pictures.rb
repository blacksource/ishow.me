class CreateSharePictures < ActiveRecord::Migration
  def change
    create_table :share_pictures do |t|
      t.string 		:pic_url, 	:limit=>255
      t.integer 	:show_order
     
      t.references	:share

      t.timestamps
    end
  end
end
