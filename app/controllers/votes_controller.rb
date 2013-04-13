class VotesController < ApplicationController
  def create
    if signed_in?
      
      #See if user has already voted on that API
      @current_votes = Vote.where("api_id = ?", params[:api_id])
      @counter = 0
      
      @current_votes.each do |vote|
        if vote.user_id = current_user.id
          @counter += 1
        end
      end
      
      if @counter > 0 
        flash[:error] = "You can't vote on the same API twice!"
        redirect_to root_path
      
      else 
        @vote = Vote.new
        @vote.api_id = params[:api_id]
        @vote.user_id = current_user.id
        @vote.value = params[:value]

          if @vote.save
            
            #Update vote count in Api model...figure out how to do this
            
            flash[:notice] = "Your vote was added"
            redirect_to root_path
          else
            flash[:error] = "Your vote was not saved"
            redirect_to root_path
          end
      end
    else
      redirect_to new_user_session_path
      flash[:error] = "You must be signed in to vote on an API"
    end
  end
end