class CreateBottomCategoryNews < ActiveRecord::Migration
  def change
    create_table :bottom_category_news do |t|
      t.references :category, index: true

      t.timestamps
    end
  end
end
