class TeamPhotosController < ApplicationController
  load_and_authorize_resource :team_photo

  # GET /team_photos
  # GET /team_photos.json
  def index
    @team_photos = TeamPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @team_photos }
    end
  end

  # GET /team_photos/1
  # GET /team_photos/1.json
  def show
    #@team_photo = TeamPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team_photo }
    end
  end

  # GET /team_photos/new
  # GET /team_photos/new.json
  def new
    @team_photo = TeamPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team_photo }
    end
  end

  # GET /team_photos/1/edit
  def edit
    #@team_photo = TeamPhoto.find(params[:id])
  end

  # POST /team_photos
  # POST /team_photos.json
  def create
    @team_photo = TeamPhoto.new(params[:team_photo])

    respond_to do |format|
      if @team_photo.save
        format.html { redirect_to @team_photo, notice: 'Team photo was successfully created.' }
        format.json { render json: @team_photo, status: :created, location: @team_photo }
      else
        format.html { render action: "new" }
        format.json { render json: @team_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /team_photos/1
  # PUT /team_photos/1.json
  def update
    #@team_photo = TeamPhoto.find(params[:id])

    respond_to do |format|
      if @team_photo.update_attributes(params[:team_photo])
        format.html { redirect_to @team_photo, notice: 'Team photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_photos/1
  # DELETE /team_photos/1.json
  def destroy
    #@team_photo = TeamPhoto.find(params[:id])
    @team_photo.destroy

    respond_to do |format|
      format.html { redirect_to team_photos_url }
      format.json { head :no_content }
    end
  end
end
