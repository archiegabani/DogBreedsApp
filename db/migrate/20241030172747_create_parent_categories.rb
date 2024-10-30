class CreateParentCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :parent_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
