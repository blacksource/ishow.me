class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string 			:tid,				:limit=>50
      t.decimal 		:price
      t.datetime		:created
      t.string			:seller_nick,		:limit=>50
      t.decimal			:commission_fee
      t.string			:receiver_name,		:limit=>50
      t.string			:receiver_mobile,	:limit=>30
      t.string			:receiver_phone,	:limit=>30
      t.string			:receiver_state,	:limit=>20
      t.string			:receiver_city,		:limit=>20
      t.string			:receiver_district,	:limit=>20
      t.string			:receiver_address,	:limit=>50
      t.string			:receiver_zip,		:limit=>10

      t.references		:user,		:as=>:buyer_id 

      t.timestamps
    end
  end
end
