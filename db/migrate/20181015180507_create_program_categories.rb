class CreateProgramCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :program_categories do |t|
      t.integer :program_id
      t.integer :item_id
    end
  end
end
