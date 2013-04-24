class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :results
      t.string :customer_id

      t.timestamps
    end
  end
end
