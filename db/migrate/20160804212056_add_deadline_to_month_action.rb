class AddDeadlineToMonthAction < ActiveRecord::Migration
  def change
    add_belongs_to :deadlines, :month_action, index: true, foreign_key: true
  end
end
