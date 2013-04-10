class AddUrlToApis < ActiveRecord::Migration
  def change
    add_column :apis, :url, :string
  end
end
