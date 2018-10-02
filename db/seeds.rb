# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create Employees
employee_list = ['joostva', 'koenp', 'leenc', 'wimlz', 'woutercd', 'bartr', 'lievendf', 'lievenca', 'jans', 'yvesvw']
employee_list.each do |employee_name|
  Employee.create(name: employee_name)
end

20.times do

end
