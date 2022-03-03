class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      ##ジャンル名
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end
