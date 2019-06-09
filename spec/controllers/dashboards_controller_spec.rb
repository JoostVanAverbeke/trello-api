require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #details" do
    it "returns http success" do
      team = FactoryBot.create(:team)
      employee = FactoryBot.create(:employee, team_id: team.id)
      dashboard = FactoryBot.create(:dashboard, employee_id: employee.id)
      get :details, params: { id: dashboard.id }
      expect(response).to have_http_status(:success)
    end
  end

end
