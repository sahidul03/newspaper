class AddLinkToLastRightSideAds < ActiveRecord::Migration
  def change
    add_column :last_right_side_ads, :link, :string
  end
end
