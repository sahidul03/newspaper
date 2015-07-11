class CreateRightCategoryNews < ActiveRecord::Migration
  def change
    create_table :right_category_news do |t|
      t.references :category, index: true

      t.timestamps
    end
  end
end
