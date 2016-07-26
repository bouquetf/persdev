class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :vision
      t.string :target
      t.string :role
      t.string :axis
      t.string :resources
      t.belongs_to :domain

      t.timestamps null: false
    end
  end
end
