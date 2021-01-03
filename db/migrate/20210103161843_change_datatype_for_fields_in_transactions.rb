class ChangeDatatypeForFieldsInTransactions < ActiveRecord::Migration[6.0]
  def change
      change_column :transactions do |t|
      t.change :date, :date
      t.change :time, :time
      end
  end
end
