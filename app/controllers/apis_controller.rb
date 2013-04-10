class ApisController < ApplicationController
  def index
    if params[:categories]
      @cat_id = params[:categories][:categories_id]
      @cat_name = Categories.find(@cat_id).name
      
      @all = Api.where("category = ?", @cat_name)
    end
    
    @api = Api.all
  end
  
  def new
    @categories = Categories.all
    @cat_array = []
    @categories.each do |cat|
      @cat_array.push(cat.name)
    end
    @api = Api.new
  end
  
  def create
    @api = Api.new(params[:api])
    
    if @api.save
      redirect_to apis_path, notice: "Yay!"
    end
  end
  
  def show
    @api = Api.all
  end
  
end