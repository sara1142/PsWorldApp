class AddAvatarToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :avatar, :string
  end
end
