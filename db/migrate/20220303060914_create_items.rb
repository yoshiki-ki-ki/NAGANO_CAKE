class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      ##ジャンルID
      t.integer :genre_id, null: false, default: ""
      ##商品名
      t.string :name, null: false, default: ""
      ##商品説明文
      t.text :introduction, null: false, default: ""
      ##税抜き価格
      t.integer :price, null: false, default: ""
      ##販売
      t.boolean :is_active, null: false, default: "true"

      t.timestamps
    end
  end
end
