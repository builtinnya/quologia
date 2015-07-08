class ChangeUsersNickname < ActiveRecord::Migration
  def change
    change_column_null :users, :nickname, true
  end
end
