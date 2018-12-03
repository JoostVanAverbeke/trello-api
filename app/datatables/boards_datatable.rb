class BoardsDatatable
  def initialize(team, params)
    @team = team
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
    boards
  end

  def total_items
    boards
    @total_items
  end

  def number_of_items
    boards.length
  end

  def boards
    @boards ||= fetch_boards
  end

  def fetch_boards
    boards = lookup_boards.page(page).per_page(page_size)
  end

  def lookup_boards
    if (@team)
      boards = @team.boards.order("#{sort_column} #{sort_direction}")
    else
      boards = Board.order("#{sort_column} #{sort_direction}")
    end
    @total_items = boards.length
    boards
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