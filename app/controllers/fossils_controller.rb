class FossilsController < ApplicationController
  # GET /fossils
  # GET /fossils.xml
  load_and_authorize_resource
  def index
  
  redirect_to collections_path
#     @fossils = Fossil.all
# 
#     respond_to do |format|
#       format.html # index.html.erb
#       format.xml  { render :xml => @fossils }
#     end
  end

  # GET /fossils/1
  # GET /fossils/1.xml
  def show
    #@fossil = Fossil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fossil }
    end
  end

  # GET /fossils/new
  # GET /fossils/new.xml
  def new
    #@fossil = Fossil.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fossil }
    end
  end

  # GET /fossils/1/edit
  def edit
   # @fossil = Fossil.find(params[:id])
  end

  # POST /fossils
  # POST /fossils.xml
  def create
   # @fossil = Fossil.new(params[:fossil])

    respond_to do |format|
      if @fossil.save
        format.html { redirect_to(@fossil, :notice => 'Fossil was successfully created.') }
        format.xml  { render :xml => @fossil, :status => :created, :location => @fossil }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fossil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fossils/1
  # PUT /fossils/1.xml
  def update
   # @fossil = Fossil.find(params[:id])

    respond_to do |format|
      if @fossil.update_attributes(params[:fossil])
        format.html { redirect_to(@fossil, :notice => 'Fossil was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fossil.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fossils/1
  # DELETE /fossils/1.xml
  def destroy
   # @fossil = Fossil.find(params[:id])
    @fossil.destroy

    respond_to do |format|
      format.html { redirect_to(fossils_url) }
      format.xml  { head :ok }
    end
  end
end
