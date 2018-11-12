class BoardsController < ApplicationController
  before_action :set_team, only: :index
  def index
    if @team
      render json: @team.boards
    else
      render json: Board.all
    end
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
                    employee: { only: [ :short_name, :last_name, :first_name] }
                }
              }
          }
        },
        team: { only: [ :name] }
    ])
  end

  private

  def set_team
    @team = Team.find(params[:team_id]) if params[:team_id]
  end

end
