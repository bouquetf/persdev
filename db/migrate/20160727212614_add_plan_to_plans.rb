class AddPlanToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :plan, :string
  end
end
