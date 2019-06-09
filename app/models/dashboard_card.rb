class DashboardCard < ApplicationRecord
  belongs_to :dashboard
  has_many :function_parameters
end
