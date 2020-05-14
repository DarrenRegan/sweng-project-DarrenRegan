class CreateGamegenres < ActiveRecord::Migration
  def change
    create_table :gamegenres do |t|
      t.string :title
      t.integer :difficulty
      t.string :description

      t.timestamps null: false
    end
  end
end
