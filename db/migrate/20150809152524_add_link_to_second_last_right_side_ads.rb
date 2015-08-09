class AddLinkToSecondLastRightSideAds < ActiveRecord::Migration
  def change
    add_column :second_last_right_side_ads, :link, :string
  end
end
