class CreateAnagrams < ActiveRecord::Migration
  def change
    create_table :anagrams do |t|
      t.string :w1
      t.string :w2
      t.boolean :result

      t.timestamps null: false
    end
  end
end
