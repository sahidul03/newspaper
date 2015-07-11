class CreateLeftCategoryNews < ActiveRecord::Migration
  def change
    create_table :left_category_news do |t|
      t.references :category, index: true

      t.timestamps
    end
  end
end
