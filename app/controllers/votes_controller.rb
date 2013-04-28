class VotesController < ApplicationController
  def create
    if signed_in?
      if current_user.already_voted_on? params[:api_id] 
        flash[:error] = "You can't vote on the same API twice!"
        redirect_to root_path
      else 
        @vote = Vote.new
        @vote.api_id = params[:api_id]
        @vote.user_id = current_user.id
        @vote.value = params[:value]

          if @vote.save
            #Update vote count in API model
            @api = Api.find(params[:api_id])
            @numvotes = Vote.where("api_id = ?", params[:api_id]).count
            @api["votes"] = @numvotes
            @api.save
            
            flash[:notice] = "Your vote was added"
            redirect_to root_path
          else
            flash[:error] = "Your vote was not saved"
            redirect_to root_path
          end
      end
    else
      link = "<a href='/users/sign_in'>Sign in here.</a>"
      flash[:error] = "You must be signed in to vote on an API. #{link}".html_safe
      redirect_to root_path
    end
  end
end