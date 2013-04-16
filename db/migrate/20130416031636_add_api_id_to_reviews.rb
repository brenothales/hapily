class AddApiIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :api_id, :integer
  end
end
