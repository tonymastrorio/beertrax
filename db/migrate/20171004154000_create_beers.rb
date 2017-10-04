class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
        t.string :name
        t.string :brewery
        t.string :ratebeer_url
        t.string :style
        t.integer :rating
        t.string :comments

      t.timestamps null: false
    end
  end
end
