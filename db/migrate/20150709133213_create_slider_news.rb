class CreateSliderNews < ActiveRecord::Migration
  def change
    create_table :slider_news do |t|
      t.references :post, index: true

      t.timestamps
    end
  end
end
