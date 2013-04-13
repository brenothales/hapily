class AddVotesToApis < ActiveRecord::Migration
  def change
    add_column :apis, :votes, :integer, :default => 0
  end
end
