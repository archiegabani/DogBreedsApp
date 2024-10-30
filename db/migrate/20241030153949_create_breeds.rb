class CreateBreeds < ActiveRecord::Migration[7.2]
  def change
    create_table :breeds do |t|
      t.string :name
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
