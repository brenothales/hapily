class ApisController < ApplicationController
  def index
    
    @categories = Categories.all
    
    if params[:tag]
      @all = Api.where("category = ?", params[:tag]).order("votes desc").page(params[:page]).per_page(25)
    else
      @all = Api.all
      @all = Api.order("votes desc").page(params[:page]).per_page(25)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @all }
      format.js
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
      flash[:error] = "Your API was not saved. Please check the fields and try again."
      redirect_to new_api_path
    end
  end
  
  def show
    @api = Api.all
  end
end