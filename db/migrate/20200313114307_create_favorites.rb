class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :viewed, null: false, default: false

      t.timestamps
    end
  end
end
