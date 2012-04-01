class CreateRebates < ActiveRecord::Migration
  def change
    create_table :rebates do |t|
      t.integer 	:level
      t.decimal 	:amount
      t.references	:product

      t.timestamps
    end
  end
end
