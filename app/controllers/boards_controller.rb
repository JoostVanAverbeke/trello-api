class BoardsController < ApplicationController
  def index
    render json: Board.all
  end

  def show
    render json: Board.find(params[:id])
  end

  def details
    board = Board.find(params[:id])
    render json: board.as_json( include: [
        lanes: {
            include: {
              cards: {
                  include: {
                    employee: { only: [ :last_name, :first_name] }
                }
              }
          }
        },
        team: { only: [ :name] }
    ])
  end
end
