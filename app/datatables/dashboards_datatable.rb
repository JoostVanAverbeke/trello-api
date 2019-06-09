class DashboardsDatatable
  def initialize(params)
    @params = params
  end

  def as_json(options = {})
    {
        items: items,
        page: {
            page_size: page_size,
            total_items: total_items,
            number_of_items: number_of_items,
            page_number: page
        }
    }
  end

  private

  def items
    dashboards
  end

  def total_items
    dashboards
    @total_items
  end

  def number_of_items
    dashboards.length
  end

  def dashboards
    @dashboards ||= fetch_dashboards
  end

  def fetch_dashboards
    dashboards = lookup_dashboards.page(page).per_page(page_size)
  end

  def lookup_dashboards
    dashboards = Dashboard.order("#{sort_column} #{sort_direction}")
    @total_items = dashboards.length
    dashboards
  end

  def page
    @params[:page] && @params[:page].to_i > 0 ?  @params[:page].to_i : 1
  end

  def page_size
    @params[:page_size] && @params[:page_size].to_i > 0 ? @params[:page_size].to_i : 10
  end

  def sort_column
    @params[:sort_column] ? @params[:sort_column] : "title"
  end

  def sort_direction
    @params[:sort_direction] == "desc" ? "desc" : "asc"
  end
  
end
