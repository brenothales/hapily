class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :api_id
      t.integer :user_id
      t.integer :vote_id

      t.timestamps
    end
  end
end
