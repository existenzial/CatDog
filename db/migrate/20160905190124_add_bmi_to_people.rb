class AddBmiToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :bmi, :float
  end
end
