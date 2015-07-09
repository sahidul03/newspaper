class CreateSpecialNews < ActiveRecord::Migration
  def change
    create_table :special_news do |t|
      t.references :post, index:true

      t.timestamps
    end
  end
end
