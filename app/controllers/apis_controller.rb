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
    @api.created_by_id = current_user.id
    
    if @api.save
      
      #Send me an email with API info
      ApiMailer.submit_api(@api).deliver
      
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
    
    #Calculate the average rating
    @reviewsum = 0
    @numreviews = @reviews.count
    @reviews.each do |review|
      @reviewsum += review.rating
    end
    @avg_rating = (@reviewsum / @numreviews).to_i unless @reviewsum == 0
    
    @review = Review.new
  end
  
  def search
    @results = Api.where("name ILIKE ? OR description ILIKE ? OR category ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%").all
    if @results.empty?
      flash[:error] = "No APIs match your search criteria."
      redirect_to root_path
    end
  end
end