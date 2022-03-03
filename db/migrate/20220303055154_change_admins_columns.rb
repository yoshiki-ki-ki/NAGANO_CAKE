class ChangeAdminsColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :create_at, :datetime, null: false, default: "now"
    remove_column :admins, :update_at, :datetime, null: false, default: "now"
  end
end
