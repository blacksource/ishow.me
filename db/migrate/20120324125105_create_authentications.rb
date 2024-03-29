class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string  :provider,               :nil=>false,   :limit=>20
      t.string  :oauth_token,            :nil=>false,   :limit=>100
      t.string  :oauth_token_secret,     :nil=>false,   :limit=>100
      t.string  :uid,                    :nil=>false,   :limit=>50
      t.string  :user_name,              :nil=>false,   :limit=>50
      t.string  :avatar,                                :limit=>100
      t.string  :sex,                                   :limit=>1
      t.string  :email,                                 :limit=>50
      t.datetime  :birthday
      t.string  :type,                                  :limit=>1
      
      t.timestamps
    end
  end
end
