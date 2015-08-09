class AddLinkToHeaderBottomAds < ActiveRecord::Migration
  def change
    add_column :header_bottom_ads, :link, :string
  end
end
