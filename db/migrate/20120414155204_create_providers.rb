class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string 		:name
      t.string		:url
      t.string		:app_key
      t.string		:app_secret
      t.string		:provider_name

      t.timestamps
    end
  end
end
