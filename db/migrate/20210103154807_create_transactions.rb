class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
    t.string :date
    t.string :time
    t.references :vehicle, null: false, foriegn_key: true
    t.references :user, null: false, foreign_key: true
    end
  end
end
