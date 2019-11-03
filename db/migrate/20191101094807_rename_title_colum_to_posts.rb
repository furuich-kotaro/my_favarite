class RenameTitleColumToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :title, :address
  end
end
