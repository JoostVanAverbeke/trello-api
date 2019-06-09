class EmployeesDatatable
  def initialize(params)
    @params = params
  end

  def as_json(options = {})
    {
        items: items.as_json(methods: [ :team_name]),
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
    employees
  end

  def total_items
    employees
    @total_items
  end

  def number_of_items
    employees.length
  end

  def employees
    @employees ||= fetch_employees
  end

  def fetch_employees
    employees = lookup_employees.page(page).per_page(page_size)
  end

  def lookup_employees
    employees = Employee.order("#{sort_column} #{sort_direction}")
    @total_items = employees.length
    employees
  end

  def page
    @params[:page] && @params[:page].to_i > 0 ?  @params[:page].to_i : 1
  end

  def page_size
    @params[:page_size] && @params[:page_size].to_i > 0 ? @params[:page_size].to_i : 10
  end

  def sort_column
    @params[:sort_column] ? @params[:sort_column] : "last_name"
  end

  def sort_direction
    @params[:sort_direction] == "desc" ? "desc" : "asc"
  end

end
