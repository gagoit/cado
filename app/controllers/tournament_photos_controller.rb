class TournamentPhotosController < ApplicationController
  load_and_authorize_resource :tournament_photo

  # GET /tournament_photos
  # GET /tournament_photos.json
  def index
    @tournament_photos = TournamentPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournament_photos }
    end
  end

  # GET /tournament_photos/1
  # GET /tournament_photos/1.json
  def show
    #@tournament_photo = TournamentPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament_photo }
    end
  end

  # GET /tournament_photos/new
  # GET /tournament_photos/new.json
  def new
    @tournament_photo = TournamentPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tournament_photo }
    end
  end

  # GET /tournament_photos/1/edit
  def edit
    #@tournament_photo = TournamentPhoto.find(params[:id])
  end

  # POST /tournament_photos
  # POST /tournament_photos.json
  def create
    @tournament_photo = TournamentPhoto.new(params[:tournament_photo])

    respond_to do |format|
      if @tournament_photo.save
        format.html { redirect_to @tournament_photo, notice: 'Tournament photo was successfully created.' }
        format.json { render json: @tournament_photo, status: :created, location: @tournament_photo }
      else
        format.html { render action: "new" }
        format.json { render json: @tournament_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tournament_photos/1
  # PUT /tournament_photos/1.json
  def update
    #@tournament_photo = TournamentPhoto.find(params[:id])

    respond_to do |format|
      if @tournament_photo.update_attributes(params[:tournament_photo])
        format.html { redirect_to @tournament_photo, notice: 'Tournament photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tournament_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_photos/1
  # DELETE /tournament_photos/1.json
  def destroy
    #@tournament_photo = TournamentPhoto.find(params[:id])
    @tournament_photo.destroy

    respond_to do |format|
      format.html { redirect_to tournament_photos_url }
      format.json { head :no_content }
    end
  end
end
