class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :title
      t.references :gallery, index: true

      t.timestamps
    end
  end
end
