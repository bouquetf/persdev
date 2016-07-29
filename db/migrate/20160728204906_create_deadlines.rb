class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.date :deadline
      t.string :result
      t.string :target
      t.belongs_to :domain, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
