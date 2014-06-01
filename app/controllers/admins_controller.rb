class AdminsController < ApplicationController
  before_filter :admin
  skip_authorization_check

  PER_PAGE = 20
  USER_COLS = ["no", "avatar", "name", "email", "lose", "win", "paid"]
  # GET /admins
  # GET /admins.json
  ##
  #**Args* :
  # -+iDisplayLength+-> (Integer) number of row per page
  # -+iDisplayStart+-> (Integer) starting number
  # -+iSortCol_0+-> (Integer) locate of sort column
  # -+sSearch+-> (String) Search string
  #**Return* :
  # * (json) Matched redemptions list with paging and number all rows are finded
  #*Written:* DatPB
  ##
  def users
    if request.xhr?
      per_page = params[:iDisplayLength] ||  PER_PAGE
      per_page = per_page.to_i
      page = params[:iDisplayStart] ? ((params[:iDisplayStart].to_i/per_page) + 1) : 1

      sort_field =
        if params[:iSortCol_0].blank?
          "name"
        else
          USER_COLS[params["mDataProp_#{params[:iSortCol_0]}"]]
        end

      sort = [[sort_field, params[:sSortDir_0]]]
      
      unless params[:iSortCol_1].blank?
        sort_field = USER_COLS[params["mDataProp_#{params[:iSortCol_1]}"]]
        sort << [sort_field, params[:sSortDir_1]]
      end

      search = User.members.solr_search do
        fulltext params[:sSearch]
        order_by sort
        paginate :page => page, :per_page => per_page
      end

      @users = search.result

      render :json => @users
      return
    end

    @users = User.members

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  private
  def admin
    return false if current_user.blank?

    current_user.admin? && current_user.email == "vuongtieulong02@gmail.com"
  end
end
