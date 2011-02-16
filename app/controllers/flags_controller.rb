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

  # GET /flags/1
  # GET /flags/1.xml
  def show
    @flag = Flag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flag }
    end
  end

  # GET /flags/new
  # GET /flags/new.xml
  def new
    @flag = Flag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flag }
    end
  end

  # GET /flags/1/edit
  def edit
    @flag = Flag.find(params[:id])
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

  # PUT /flags/1
  # PUT /flags/1.xml
  def update
    @flag = Flag.find(params[:id])

    respond_to do |format|
      if @flag.update_attributes(params[:flag])
        format.html { redirect_to(@flag, :notice => 'Flag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flags/1
  # DELETE /flags/1.xml
  def destroy
    @flag = Flag.find(params[:id])
    @flag.destroy

    respond_to do |format|
      format.html { redirect_to(flags_url) }
      format.xml  { head :ok }
    end
  end
end
