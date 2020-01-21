class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.text :comment
      t.integer :idoltype
      t.integer :mv
      t.string :idolname
      t.integer :user_id

      t.timestamps
    end
  end
end
