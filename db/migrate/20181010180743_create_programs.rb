class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :url
      t.string "install_date"
      t.integer :user_id
    end
  end
end
