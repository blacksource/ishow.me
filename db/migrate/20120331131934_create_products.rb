class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string    :name
      t.decimal   :price
      t.string    :image
      t.datetime  :start_time
      t.datetime  :end_time
      t.integer   :max_share_count
      t.integer   :shared_count
      t.string    :status
      t.integer   :created_by

      t.timestamps
    end
  end
end
