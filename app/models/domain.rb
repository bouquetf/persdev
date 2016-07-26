class Domain < ActiveRecord::Base
  belongs_to :user
  has_one :plan
end
