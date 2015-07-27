class CreateLastRightSideAds < ActiveRecord::Migration
  def change
    create_table :last_right_side_ads do |t|
      t.string :ad_picture

      t.timestamps
    end
  end
end
