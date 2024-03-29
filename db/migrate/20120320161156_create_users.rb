class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :email,              :nil=>false
      t.string    :name,               :nil=>false
      t.string    :password_digest,    :nil=>false
      t.string    :sex,                :default=>""
      t.string    :status,             :default=>"A"
      t.date      :birthday
      t.datetime  :last_login_at
      t.string    :last_login_ip
      t.string    :realname
      t.string    :avatar

      t.timestamps
    end
  end
end
