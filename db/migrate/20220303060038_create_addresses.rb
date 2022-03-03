class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      ##会員ID
      t.integer :customer_id, null: false, default: ""
      ##宛名
      t.string :name, null: false, default: ""
      ##郵便番号
      t.string :postal_code, null: false, default: ""
      ##住所
      t.string :address, null: false, default: ""

      t.timestamps
    end
  end
end
