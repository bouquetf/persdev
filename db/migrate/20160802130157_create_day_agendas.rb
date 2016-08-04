class CreateDayAgendas < ActiveRecord::Migration
  def change
    create_table :day_agendas do |t|
      t.date :day
      t.string :agenda
      t.string :quote
      t.string :targets
      t.string :actions
      t.string :success
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
