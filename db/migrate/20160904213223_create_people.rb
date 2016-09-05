class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.integer :height
      t.integer :weight
      t.string :prediction

      t.timestamps
    end
  end
end
