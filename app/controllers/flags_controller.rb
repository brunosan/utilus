class FlagsController < ApplicationController
  # GET /flags
  # GET /flags.xml
  def index
    @flags = Flag.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flags }
    end
  end


  # POST /flags
  # POST /flags.xml
  def create
    @flag = Flag.new(:answer_id => params[:answer_id])
    message="Thanks for flagging that question! Here´s another question."
      if @flag.save
        redirect_to root_path, :notice => message
      else
        format.html { render :action => "new" }
      end
  end

end
