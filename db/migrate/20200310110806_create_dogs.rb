class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name, null: false, default: ''
      t.string :slug, null: false, unique: true
      t.string :birth, null: false, default: ''
      t.string :breed, null: false, default: ''
      t.integer :sex
      t.string :temperament, null: false, default: ''
      t.boolean :vaccinated, null: false, default: false
      t.string :image
      t.string :length
      t.string :size
      t.float :weight
      t.string :pelage, null: false, default: ''
      t.string :pelage_color, null: false, default: ''
      t.boolean :pedigree, null: false, default: false
      t.string :mother_name, null: false, default: ''
      t.string :father_name, null: false, default: ''
      t.string :register
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
