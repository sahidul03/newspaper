class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :photo
      t.string :video
      t.integer :view_count, :default => 0
      t.references :category, index: true

      t.timestamps
    end
  end
end
