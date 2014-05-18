class BetScoresController < ApplicationController
  load_resource :match
  # GET /bet_scores
  # GET /bet_scores.json
  def index
    @bet_scores = @match.bet_scores

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bet_scores }
    end
  end

  # GET /bet_scores/1
  # GET /bet_scores/1.json
  def show
    @bet_score = @match.bet_scores.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bet_score }
    end
  end

  # GET /bet_scores/new
  # GET /bet_scores/new.json
  def new
    @bet_score = @match.bet_scores.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bet_score }
    end
  end

  # GET /bet_scores/1/edit
  def edit
    @bet_score = @match.bet_scores.find(params[:id])
  end

  # POST /bet_scores
  # POST /bet_scores.json
  def create
    params[:bet_score].merge!({user_id: current_user.id})
    @bet_score = @match.bet_scores.new(params[:bet_score])

    respond_to do |format|
      if @bet_score.save
        format.html { redirect_to new_match_bet_score_path(@match), notice: 'Bet score was successfully created.' }
        format.json { render json: @bet_score, status: :created, location: @bet_score }
      else
        format.html { render action: "new" }
        format.json { render json: @bet_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bet_scores/1
  # PUT /bet_scores/1.json
  def update
    @bet_score = @match.bet_scores.find(params[:id])

    respond_to do |format|
      if @bet_score.update_attributes(params[:bet_score])
        format.html { redirect_to match_bet_score_path(@match, @bet_score), notice: 'Bet score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bet_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bet_scores/1
  # DELETE /bet_scores/1.json
  def destroy
    @bet_score = @match.bet_scores.find(params[:id])
    @bet_score.destroy

    respond_to do |format|
      format.html { redirect_to new_match_bet_score_path(@match) }
      format.json { head :no_content }
    end
  end
end
