class CreateMonthActions < ActiveRecord::Migration
  def change
    create_table :month_actions do |t|
      t.date :month
      t.string :result
      t.string :target
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
