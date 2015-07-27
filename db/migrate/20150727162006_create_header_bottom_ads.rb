class CreateHeaderBottomAds < ActiveRecord::Migration
  def change
    create_table :header_bottom_ads do |t|
      t.string :ad_picture

      t.timestamps
    end
  end
end
