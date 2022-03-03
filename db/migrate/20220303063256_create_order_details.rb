class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      ##注文ID
      t.integer :order_id, null: false, default: ""
      ##商品ID
      t.integer :item_id, null: false, default: ""
      ##購入時価格（税込み）
      t.integer :price, null: false, default: ""
      ##数量
      t.integer :amount, null: false, default: ""
      ##製作ステータス enumで管理, {0: 製作不可, 1:製作待ち, 2: 製作中, 3: 製作完了}
      t.integer :making_status, null: false, default: "0"
      
      t.timestamps
    end
  end
end
