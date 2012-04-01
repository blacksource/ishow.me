class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string    :name,            :nil=>false,  :limit=>100
      t.decimal   :price,           :nil=>false
      t.string    :image_url,       :limit=>255
      t.string    :source_url,      :limit=>500
      t.datetime  :start_time
      t.datetime  :end_time
      t.integer   :max_share_count
      t.integer   :shared_count
      t.string    :status,          :default=>'A'
      t.integer   :created_by
      # t.integer   :shop_id          
      t.references  :shop
      

      t.timestamps
    end
  end
end
