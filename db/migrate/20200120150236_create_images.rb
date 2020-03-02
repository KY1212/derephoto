class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.text :comment
      t.string :idoltype
      t.string :mv
      t.string :idolname
      t.integer :user_id
      t.integer :likes_count
      t.integer :comments_count
      t.timestamps
    end
  end
end
