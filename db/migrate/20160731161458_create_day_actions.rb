class CreateDayActions < ActiveRecord::Migration
  def change
    create_table :day_actions do |t|
      t.date :day
      t.integer :importance
      t.integer :duration
      t.string :action
      t.string :result
      t.string :target
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
