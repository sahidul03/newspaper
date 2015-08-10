class AddSubEditor2ToNewsProperties < ActiveRecord::Migration
  def change
    add_column :news_properties, :sub_editor2, :string
  end
end
