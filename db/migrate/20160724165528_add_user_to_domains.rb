class AddUserToDomains < ActiveRecord::Migration
  def change
    add_belongs_to :domains, :user
  end
end
