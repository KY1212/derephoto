class CreateIdols < ActiveRecord::Migration[5.2]
  def change
    create_table :idols do |t|
      t.string :idolname
      t.string :hurigana
      t.integer :idoltype

      t.timestamps
    end
  end
end
