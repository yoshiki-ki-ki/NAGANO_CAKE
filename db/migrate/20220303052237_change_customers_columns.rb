class ChangeCustomersColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :create_at, :datetime, null: false, default: "now"
    remove_column :customers, :update_at, :datetime, null: false, default: "now"
    change_column_default :customers, :is_active, from: true, to: "false"
  end
end
