class AddCreatedByIdToApis < ActiveRecord::Migration
  def change
    add_column :apis, :created_by_id, :integer
  end
end
