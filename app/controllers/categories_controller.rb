class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      flash[:notice] = @category.name + " was added to categories."
      respond_to do |format|
        format.html { redirect_to new_api_path }
        format.js
      end
    else
      flash[:error] = "An error occurred. Please try again."
    end
  end
  
  def index
  end
  
  def edit
  end
  
  def show
  end
end