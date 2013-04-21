class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      redirect_to new_api_path
    end
  end
  
  def index
  end
  
  def edit
  end
  
  def show
  end
end