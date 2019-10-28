class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title,              null: false, default: ""
      t.string :description
      t.string :picture,              null: false, default: ""

      t.timestamps
    end
  end
end
