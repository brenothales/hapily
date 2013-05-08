class Category < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :uniqueness => { :case_sensitive => false }, :presence => true

  def category_array
    categories = Category.all
    cat_array = []
    categories.each do |cat|
      cat_array.push(cat.name)
    end
    cat_array.sort_by! { |m| m.downcase }
  end
end
