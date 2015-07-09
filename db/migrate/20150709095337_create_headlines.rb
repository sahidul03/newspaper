class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.references :post, index: true

      t.timestamps
    end
  end
end
