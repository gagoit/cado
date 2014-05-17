class MatchPhotosController < ApplicationController
  # GET /match_photos
  # GET /match_photos.json
  def index
    @match_photos = MatchPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @match_photos }
    end
  end

  # GET /match_photos/1
  # GET /match_photos/1.json
  def show
    @match_photo = MatchPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match_photo }
    end
  end

  # GET /match_photos/new
  # GET /match_photos/new.json
  def new
    @match_photo = MatchPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match_photo }
    end
  end

  # GET /match_photos/1/edit
  def edit
    @match_photo = MatchPhoto.find(params[:id])
  end

  # POST /match_photos
  # POST /match_photos.json
  def create
    @match_photo = MatchPhoto.new(params[:match_photo])

    respond_to do |format|
      if @match_photo.save
        format.html { redirect_to @match_photo, notice: 'Match photo was successfully created.' }
        format.json { render json: @match_photo, status: :created, location: @match_photo }
      else
        format.html { render action: "new" }
        format.json { render json: @match_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /match_photos/1
  # PUT /match_photos/1.json
  def update
    @match_photo = MatchPhoto.find(params[:id])

    respond_to do |format|
      if @match_photo.update_attributes(params[:match_photo])
        format.html { redirect_to @match_photo, notice: 'Match photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_photos/1
  # DELETE /match_photos/1.json
  def destroy
    @match_photo = MatchPhoto.find(params[:id])
    @match_photo.destroy

    respond_to do |format|
      format.html { redirect_to match_photos_url }
      format.json { head :no_content }
    end
  end
end
