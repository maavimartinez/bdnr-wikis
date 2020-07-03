class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show, :edit, :update, :destroy, :addCollaborator, :addCollaboratorShow]

  # GET /repositories
  # GET /repositories.json
  def index
    @repositories = Repository.includes(:wiki).includes(:users).all
  end

  def addCollaboratorShow
    @userToAdd
  end

  def addCollaborator
    @user = User.find_by(username: repository_params[:username])
    if @user
      @repository.users.push(@user)
      redirect_to '/home'
    else
      
    end
    
   
  end

  # GET /repositories/1
  # GET /repositories/1.json
  def show
  end

  # GET /repositories/new
  def new
    @repository = Repository.new
  end

  # GET /repositories/1/edit
  def edit
  end

  # POST /repositories
  # POST /repositories.json
  def create
    @repository = Repository.new(name:repository_params[:repository][:name], users:[])
    p @current_user["_id"]
    @user = User.find(@current_user["_id"])
      if @repository.save
        @repository.users.push(@user)
        @wiki = Wiki.create!(repository_id: @repository.id)
        redirect_to '/home' 
      else
        render :new 
      end
  end

  # PATCH/PUT /repositories/1
  # PATCH/PUT /repositories/1.json
  def update
    respond_to do |format|
      if @repository.update(repository_params)
        format.html { redirect_to @repository, notice: 'Repository was successfully updated.' }
        format.json { render :show, status: :ok, location: @repository }
      else
        format.html { render :edit }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repositories/1
  # DELETE /repositories/1.json
  def destroy
    @repository.destroy
    respond_to do |format|
      format.html { redirect_to repositories_url, notice: 'Repository was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repository
      @repository = Repository.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repository_params
      params.permit!
    end
end
