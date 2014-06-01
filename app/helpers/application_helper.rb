
module ApplicationHelper
  
	def will_paginate_array(array, options = {})
    page     = options[:page] || 1
    per_page = options[:per_page] || WillPaginate.per_page
    total    = options[:total_entries] || array.size

    collection = WillPaginate::Collection.create(page, per_page, total) do |pager|
      pager.replace array[pager.offset, pager.per_page].to_a
    end

    will_paginate collection, :param_name => (options[:param_name] || "page")
  end

  def collect_options_from_hash(hash)
    hash.collect { |a,b| 
      if b.is_a?(Symbol)
        [b.to_s.titleize, a]
      else 
        [b, a]
      end
    }
  end

  def nav_class(name)
    if params[:controller] == "#{name.pluralize}" || params[:controller] == "#{name}_photos"
      "active"
    else
      ""
    end
  end

  def converttime(time)
    {
      mytime: time.localtime,
      local: time - 3.hours,
      utc: time
    }
  end

  ##
  # HH:MM
  ##
  def converthm(time)
    new_time = converttime(time)
    {
      mytime: new_time[:mytime].strftime("%H:%M"),
      local: new_time[:local].strftime("%H:%M"),
      utc: new_time[:utc].strftime("%H:%M")
    }
  end
end
