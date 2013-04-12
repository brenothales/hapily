class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.text :name
      t.text :description
      t.text :category
      t.integer :favorites
    end
  end
end
