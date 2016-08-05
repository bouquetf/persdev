class Deadline < ActiveRecord::Base
  belongs_to :domain
  belongs_to :month_action
end
