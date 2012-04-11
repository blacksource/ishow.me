class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string 		:comment,		:limit=>255, 	:nil=>false
      t.string 		:status,		:limit=>1, 		:default=>'P'
      t.string		:check_status,	:limit=>1, 		:default=>'P'

      t.references	:product
      t.references	:user
      t.timestamps
    end
  end
end
