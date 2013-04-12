class ApisController < ApplicationController
  def index
    
    @categories = Categories.all
    
    if params[:tag]
      @all = Api.where("category = ?", params[:tag])
    else
      @all = Api.all
    end

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