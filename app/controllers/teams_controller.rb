class TeamsController < ApplicationController
  before_action :set_team, only: [ :show]
  def index
    @teams = Team.all
    json_response @teams
  end

  def show
    json_response @team
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end
end
