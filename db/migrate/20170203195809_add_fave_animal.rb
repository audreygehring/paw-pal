class AddFaveAnimal < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorite_animal, :string
  end
end
