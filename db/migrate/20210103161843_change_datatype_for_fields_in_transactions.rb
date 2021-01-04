class ChangeDatatypeForFieldsInTransactions < ActiveRecord::Migration[6.0]
  def change
      change_column :transactions, :date, :date
      change_column :transactions, :time, :time
  end
end
