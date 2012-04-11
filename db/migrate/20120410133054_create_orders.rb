class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string 		:oid,		:limit=>50
      t.string		:title,		:limit=>255
      t.string		:num_iid,	:limit=>50
      t.integer		:num
      t.decimal		:price
      t.decimal		:total_fee
      t.string		:pic_path,	:limit=>255
   
   	  t.references	:trade 

      t.timestamps
    end
  end
end
