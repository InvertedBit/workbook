class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :home]
  load_and_authorize_resource
  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  def home
    @page = Page.where(:name => "home").limit(1)
    @page = @page[0]

    respond_to do |format|
      format.html { render @page.type.name }
      format.xml { render :xml => @page }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    if params[:name]
      @page = Page.where(:name => params[:name]).limit(1)
      @page = @page[0]
    elsif params[:id].to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil
      @page = Page.where(:name => params[:id]).limit(1)
		  @page = @page[0]
    else
      @page = Page.find(params[:id])
    end
    respond_to do |format|
      format.html { render @page.type.name } # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new
		@types = Type.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
		@types = Type.all
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])
		
    respond_to do |format|
      if @page.save
        format.html { redirect_to(@page, :notice => 'Page was successfully created.') }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(@page, :notice => 'Page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
end
