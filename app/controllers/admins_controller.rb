class AdminsController < ApplicationController
  before_filter :admin
  skip_authorization_check

  PER_PAGE = 20
  USER_COLS = ["no", "avatar", "name", "email", "lose", "win", "paid"]

  def index
  end

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
          params["mDataProp_#{params[:iSortCol_0]}"]
        end

      sort = [[sort_field, params[:sSortDir_0]]]
      
      unless params[:iSortCol_1].blank?
        sort_field = USER_COLS[params["mDataProp_#{params[:iSortCol_1]}"]]
        sort << [sort_field, params[:sSortDir_1]]
      end

      @users = User.members.order_by(sort)#.paginate(:page => page, :per_page => per_page)
      #.full_text_search(params[:sSearch]).asc(:name)
      puts @users.count

      result_data = {
        "aaData" => [],
        "iTotalDisplayRecords" => @users.count
      }

      @users.each_with_index do |e, index|
        row = {}
        row["no"] = index
        row["avatar"] = e.avatar.url
        ["name", "email", "lose", "win", "paid"].each do |key|
          row[key] = e.send(key.to_sym)
        end

        result_data["aaData"] << row
      end

      render :json => result_data
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
