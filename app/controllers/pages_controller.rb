class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  def newPage
    @page = Page.new
    @wiki_id = page_params[:wiki_id]
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(history:[],wiki_id: page_params[:page][:wiki_id],title: page_params[:page][:title], message: page_params[:page][:message], content:page_params[:page][:content], last_modification_date: Time.zone.now() )
    
      if @page.save
        redirect_to '/wikis/'+page_params[:page][:wiki_id]
        
      else
        render :new 
      end

  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update

    @oldPage = {title: @page.title, content: @page.content, message: @page.message, last_modification_date: @page.last_modification_date}
    if @page.history != nil
      @oldHistory = @page.history
      @oldHistory.unshift(@oldPage)
    else
      @oldHistory = Array.new
      @oldHistory.unshift(@page)
    end
      if @page.update!(
        title: page_params[:page][:title],
         message: page_params[:page][:message],
          content:page_params[:page][:content],
           last_modification_date: Time.zone.now(),
           history: @oldHistory )
        redirect_to '/wikis/'+@page.wiki_id
      else
        render :edit 
      end
  
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
      p "-------------------------------------"
      @page.history.each do |a|
        p a
      end
      
      p "-------------------------------------"
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.permit!
    end
end
