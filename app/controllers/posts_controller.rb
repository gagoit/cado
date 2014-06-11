class PostsController < ApplicationController
  load_and_authorize_resource :post, except: [:index, :search]
  # GET /posts
  # GET /posts.json
  respond_to :html, :xml, :json
  
  layout "post_layout"

  def index
    page = (params[:page].to_i || 1).to_i
    per_page = (params[:per_page] || 30).to_i

    if params[:category].blank?
      @posts = Post.all
    else
      @posts = Post.by_category(params[:category])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    # @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        @post.created!(current_user)
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    # @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    # @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  ##
  # Full Text search
  ##
  def search
    if params[:search].blank?
      @posts = Post.all
    else
      @posts = Post.any_of({body: Regexp.new(params[:search])}, {title: Regexp.new(params[:search])}).order_by([:created_at, :desc])#.paginate( :page => 1, :per_page => 500)
    end

    respond_to do |format|
      format.html {render :layout => false}
      format.json { render json: @posts }
    end
  end
end
