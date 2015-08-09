class AddSubEditorToNewsProperties < ActiveRecord::Migration
  def change
    add_column :news_properties, :sub_editor, :string
  end
end
