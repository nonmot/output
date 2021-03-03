class RemoveTitleFromGroupUsers < ActiveRecord::Migration[6.1]
  def change
    remove_columns :group_users, :title
  end
end
