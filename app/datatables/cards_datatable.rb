class CardsDatatable
  
  def initialize(params)
    @params = params
  end

  # def as_json(options = {})
  #   {
  #       items: items,
  #       page: {
  #           page_size: page_size,
  #           total_items: total_items,
  #           number_of_items: number_of_items,
  #           page_number: page
  #       }
  #   }
  # end
  def as_json(options = {})
    cards
  end

  private

  def items
    cards
  end

  def total_items
    cards
    @total_items
  end

  def number_of_items
    cards.length
  end

  def cards
    @cards ||= fetch_cards
  end

  def fetch_cards
    cards = lookup_cards.page(page).per_page(page_size)
  end

  def lookup_cards
    cards = Card.order("#{sort_column} #{sort_direction}")
    @total_items = cards.length
    cards
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
