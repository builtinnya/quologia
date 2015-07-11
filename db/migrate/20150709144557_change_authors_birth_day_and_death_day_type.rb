class ChangeAuthorsBirthDayAndDeathDayType < ActiveRecord::Migration
  def change
    change_column :authors, :birthday, :string
    change_column :authors, :deathday, :string
  end
end
