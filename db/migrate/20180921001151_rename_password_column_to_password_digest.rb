class RenamePasswordColumnToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :team_infos, :password, :password_digest
  end
end
