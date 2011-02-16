class VotesController < ApplicationController
  # GET /votes
  # GET /votes.xml
  def index
    @votes = Vote.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votes }
    end
  end

  # GET /votes/new
  # POST /votes.xml
  def create
    @vote = Vote.new(:answer_id => params[:answer_id])
    message="Vote #{Vote.count +1} recorded, thanks. Here´s another question."
      if @vote.save
        redirect_to root_path, :notice => message
      else
        redirect_to :back, :notice => "Error, somewhere. Sorry".
      end
    end
  end

end
