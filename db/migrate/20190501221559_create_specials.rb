class CreateSpecials < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.string :name
      t.integer :runtime_mins
      t.integer :comedian_id
      t.string :image_url
    end
  end
end
