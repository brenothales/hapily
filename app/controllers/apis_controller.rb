class ApisController < ApplicationController
  def index
    
    @categories = Category.all
    
    if params[:tag]
      @all = Api.where("category = ?", params[:tag]).order("votes desc").page(params[:page]).per_page(25)
    else
      @all = Api.order("votes desc").page(params[:page]).per_page(25)
    end
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @all }
      format.js
    end
  end
  
  def new
    @categories = Category.all
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
    @api = Api.find(params[:id])
    @reviews = Review.where("api_id = ?", params[:id])
    
    @review = Review.new
  end
  
  def search
    @results = Api.where("name ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").all
  end
end