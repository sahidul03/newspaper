class CreateNewsProperties < ActiveRecord::Migration
  def change
    create_table :news_properties do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :logo
      t.string :febicon

      t.timestamps
    end
  end
end
