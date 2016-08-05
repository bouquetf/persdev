class MonthAction < ActiveRecord::Base
  belongs_to :user
  has_one :deadline
end
