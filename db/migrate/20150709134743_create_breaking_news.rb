class CreateBreakingNews < ActiveRecord::Migration
  def change
    create_table :breaking_news do |t|
      t.string :title

      t.timestamps
    end
  end
end
