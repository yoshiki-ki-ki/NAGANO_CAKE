class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      ##会員ID
      t.integer :customer_id, null: false, default: ""
      ##配送先郵便番号
      t.string :postal_code, null: false, default: ""
      ##配送先郵便番号
      t.string :address, null: false, default: ""
      ##配送先氏名
      t.string :name, null: false, default: ""
      ##支払方法 enumで管理, {0: クレジットカード, 1: 銀行振込}
      t.integer :payment_method, null: false, default: ""
      ##請求額
      t.integer :total_payment, null: false, default: "0"
      ##送料
      t.integer :postage, null: false, default: ""
      ##受注ステータス enumで管理, {0: 入金待ち, 1:入金確認, 2: 製作中, 3: 発送準備中, 4: 発送済み}
      t.integer :order_status, null: false, default: "0"
      
      t.timestamps
    end
  end
end
