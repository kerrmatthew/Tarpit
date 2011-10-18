class CollectionsController < ApplicationController
  # GET /collections
  # GET /collections.xml
  load_and_authorize_resource
  #skip_authorize_resource :only => :index
    
  def index
  #  @collections = Collection.all Superceded by load_and_authorize_resorce
    if session[:last_saved_fossil_id]
      @last_fossil = Fossil.find(session[:last_saved_fossil_id])
      session[:last_saved_fossil_id] = nil
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collections }
    end
  end

  def show
    respond_to do |format| 
      format.html
      format.js {  render 'show.js' }
    end
  end

  # GET /collections/new
  # GET /collections/new.xml
  def new
    #@collection = Collection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collection }
    end
  end

  # GET /collections/1/edit
  def edit
    #@collection = Collection.find(params[:id])
  end

  # POST /collections
  # POST /collections.xml
  def create
   # @collection = Collection.new(params[:collection])
    respond_to do |format|
      if @collection.save
        format.html { redirect_to(collections_path, :notice => 'Collection was successfully created.') }
        format.xml  { render :xml => @collection, :status => :created, :location => @collection }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.xml
  def update
    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html { redirect_to(collections_path, :notice => 'Collection was successfully updated.') }
        format.xml  { head :ok }
        format.js { render 'update.js' }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.xml
  def destroy
  #  @collection = Collection.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to(collections_url) }
      format.xml  { head :ok }
    end
  end
end
