# This file should contain all the record creation needed to seed the database with its default parameter_values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Teams
# End Create Teams
core_team = Team.create(name: 'CORE')
case_team = Team.create(name: 'CASE')
tars_team = Team.create(name: 'TARS')
plex_team = Team.create(name: 'PLEX')

# Create Employees
core_employee_list = [
    { first_name: 'Joost', last_name: 'Van Averbeke'},
    { first_name: 'Koen', last_name: 'Pollentier' },
    { first_name: 'Wim', last_name: 'Lanckzweirt' },
    { first_name: 'Leen', last_name: 'Clauws' },
    { first_name: 'Thibault', last_name: 'Mahieu' },
    { first_name: 'Lieven', last_name: 'Defoor' },
    { first_name: 'Lieven', last_name: 'Cardoen' },
    { first_name: 'Ziping', last_name: 'Wang' },
    { first_name: 'Yves', last_name: 'Vanwalle' }
]

case_employee_list = [
    { first_name: 'Laurens', last_name: 'Vandenberghe'},
    { first_name: 'Helmut', last_name: 'Opsomer'}
]

tars_employee_list = [
    { first_name: 'Francis', last_name: 'Braeckman'},
    { first_name: 'Stefaan', last_name: 'Deman'},
    { first_name: 'Peter', last_name: 'Vandaele'}
]

plex_employee_list = [
    { first_name: 'Jan', last_name: 'Laureyns'},
    { first_name: 'Mark', last_name: 'Kelly'}
]

# Create CORE team employees
core_employee_list.each do |employee|
  Employee.create(first_name: employee[:first_name], last_name: employee[:last_name], team_id: core_team.id)
end
# End Create CORE team employees

case_employee_list.each do |employee|
  Employee.create(first_name: employee[:first_name], last_name: employee[:last_name], team_id: case_team.id)
end

tars_employee_list.each do |employee|
  Employee.create(first_name: employee[:first_name], last_name: employee[:last_name], team_id: tars_team.id)
end

plex_employee_list.each do |employee|
  Employee.create(first_name: employee[:first_name], last_name: employee[:last_name], team_id: plex_team.id)
end
first_core_employee = core_team.employees.first
first_case_employee = case_team.employees.first
first_tars_employee = tars_team.employees.first
first_plex_employee = plex_team.employees.first

# Create Boards
20.times do |counter|
  board = Board.create(title: "sprint #{counter}", team_id: core_team.id)
  lanes_list = [
      'To do',
      'Working on it',
      'Testing',
      'Done'
  ]
  lanes_list.each do |lane_entry|
    lane = Lane.create(title: "#{lane_entry}", board_id: board.id)
    5.times do |card_counter|
      card = Card.create(title: "#{lane_entry} #{card_counter}",
                         subtitle: "subtitle #{lane_entry} #{card_counter}",
                         content: "content #{lane_entry} #{card_counter}",
                         lane_id: lane.id,
                         employee_id: first_core_employee.id
      )
    end

  end
end
# End Create Boards

# Create dashboards for employees
jva_dashboard = Dashboard.create(title: 'JVA Dashboard', employee_id: first_core_employee.id)
jva_burndown_sprint5_card = DashboardCard.create(component: 'burndown', title: 'Burndown sprint 5', dashboard_id: jva_dashboard.id)
FunctionParameter.create(parameter: 'board', parameter_type: 'integer', parameter_value: '5', dashboard_card_id: jva_burndown_sprint5_card.id)
FunctionParameter.create(parameter: 'height', parameter_type: 'integer', parameter_value: '200', dashboard_card_id: jva_burndown_sprint5_card.id)


jva_burndown_sprint3_card = DashboardCard.create(component: 'burndown', title: 'Burndown sprint 3', dashboard_id: jva_dashboard.id)
FunctionParameter.create(parameter: 'board', parameter_type: 'integer', parameter_value: '3', dashboard_card_id: jva_burndown_sprint3_card.id)
FunctionParameter.create(parameter: 'height', parameter_type: 'integer', parameter_value: '200', dashboard_card_id: jva_burndown_sprint3_card.id)

jva_boardcard6 = DashboardCard.create(component: 'board-card', title: 'My favorite', dashboard_id: jva_dashboard.id)
FunctionParameter.create(parameter: 'board', parameter_type: 'integer', parameter_value: '6', dashboard_card_id: jva_boardcard6.id)
# End create dashboard cards for employee JVA (first CORE employee)
