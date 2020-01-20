class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.text :comment
      t.integer :type
      t.integer :mv
      t.string :idolname
      t.timestamps
    end
  end
end
