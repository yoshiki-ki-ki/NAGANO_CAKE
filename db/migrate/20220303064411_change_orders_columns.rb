class ChangeOrdersColumns < ActiveRecord::Migration[6.1]
  def change
    ##支払方法　enumで管理, {0: クレジットカード, 1: 銀行振込}
    change_column_default :orders, :payment_method, from: "", to: "0"
    ##請求額
    change_column_default :orders, :total_payment, from: "0", to: ""
  end
end
