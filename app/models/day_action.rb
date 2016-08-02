class DayAction < ActiveRecord::Base
  belongs_to :user
  attr_accessor :hours, :minutes

end
