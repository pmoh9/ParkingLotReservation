class RenameOldTableToNew < ActiveRecord::Migration[6.0]
  def change
    rename_table :transact, :transactions
  end
end
