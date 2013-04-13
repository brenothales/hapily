class CategoriesController < ApplicationController
  def new
    @category = Categories.new
  end
  
  def create
    @category = Categories.new
    
    if @category.save
      redirect_to apis_path
    end
  end
  
  def index
  end
  
  def edit
  end
  
  def show
  end
end