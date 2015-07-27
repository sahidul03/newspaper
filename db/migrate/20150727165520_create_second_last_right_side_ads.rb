class CreateSecondLastRightSideAds < ActiveRecord::Migration
  def change
    create_table :second_last_right_side_ads do |t|
      t.string :ad_picture

      t.timestamps
    end
  end
end
