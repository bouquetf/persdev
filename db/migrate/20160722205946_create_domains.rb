class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.string :description
      t.integer :note
      t.string :explanation

      t.timestamps null: false
    end
  end
end
