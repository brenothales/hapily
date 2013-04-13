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
      flash[:notice] = "Your API has been saved."
      redirect_to apis_path
    else
      flash[:notice] = "There was an error and your API was not saved."
      redirect_to new_api_path
    end
  end
  
  def show
    @api = Api.all
  end
end