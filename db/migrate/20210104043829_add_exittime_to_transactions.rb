class AddExittimeToTransactions < ActiveRecord::Migration[6.0]
  def change
  	add_column :transactions, :exittime, :time
  end
end
