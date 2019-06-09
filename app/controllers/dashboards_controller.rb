class DashboardsController < ApplicationController
  def index
    @dashboards = DashboardsDatatable.new(params)
    render json: @dashboards
  end

  def details
    dashboard = Dashboard.find(params[:id])
    render json: dashboard.as_json( include: [
        dashboard_cards: {
            include: [
                function_parameters: {
                     only: [ :parameter, :parameter_type, :parameter_value]
                }
            ]
        }
    ])
  end

end
