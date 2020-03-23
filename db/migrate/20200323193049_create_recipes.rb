class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :instructions
      t.integer :cook_time
      t.integer :prep_time
      t.integer :user_id
    end
  end
end
