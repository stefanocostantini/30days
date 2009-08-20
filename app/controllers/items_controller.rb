class ItemsController < ApplicationController

  in_place_edit_for :item, :name
  in_place_edit_for :item, :notes
 
  before_filter :login_required

  # GET /items
  # GET /items.xml
  def index
    @items = @current_user.items.all(:order => 'created_at ASC')
    
    for item in @items
    
    	if ((Time.now-item.created_at)/86400).to_int >= 30 then
    	
    		item.old = true
    		item.save 
    		
    	else
    	
    		item.old = false 
    		item.save 
    		
    	end
        
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = @current_user.items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
       	
   	 	@item = @current_user.items.new
    	@item.name = params[:t]
    	@item.notes = "Click here to add a note"
    	@item.url = params[:u]
    
    	@item.save
    
    	redirect_to :action => 'show', :id => @item.id  
    	flash[:notice] = 'Item was successfully created.'
    	      
  end

	def small_login
	end

  # GET /items/1/edit
  def edit
    @item = @current_user.items.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = @current_user.items.new(params[:item])
    @item.name = params[:t]
    @item.notes = "<blank...for now>"
    @item.url = params[:u]

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@items) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = @current_user.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def delete
    @item = @current_user.items.find(params[:id])
    @item.destroy
	
    @items = @current_user.items.all(:order => 'created_at ASC')
   
  end 
  
end
