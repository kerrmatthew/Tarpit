class FossilsController < ApplicationController
  # GET /fossils
  # GET /fossils.xml
  load_and_authorize_resource
  
  before_filter :load_collection, :except => :index
  
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
    redirect_to collections_path, :notice => "That Fossil is no longer here." unless @fossil 
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
        format.html { redirect_to([@collection, @fossil], :notice => 'Fossil was successfully created.') }
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
        format.html { redirect_to([@collection, @fossil], :notice => 'Fossil was successfully updated.') }
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
    notice = "File '#{@fossil.name}' has been deleted." if @fossil.destroy
    

    respond_to do |format|
      format.html { redirect_to(collections_path, :notice => notice) }
      format.xml  { head :ok }
    end
  end
  
   
  def download
    head(:not_found) and return if (fossil = Fossil.find_by_id(params[:id])).nil?

    path = fossil.attachment.path(params[:style])
    head(:bad_request) and return unless File.exist?(path) 
    
    fossil.download_counters.build({:user => current_user, :fossil => @fossil }).save

    send_file_options = { :type => fossil.attachment_content_type, :x_sendfile => true }
    
    send_file(path, send_file_options)
    
  end


  private 
  
  def load_collection
    @collection = Collection.find(params[:collection_id]) || @fossil.collection
  end
  
  
end
