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

  # GET /votes/1
  # GET /votes/1.xml
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vote }
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

  # PUT /votes/1
  # PUT /votes/1.xml
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to(@vote, :notice => 'Vote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.xml
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to(votes_url) }
      format.xml  { head :ok }
    end
  end
end
