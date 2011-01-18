class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :nazwa
      t.text :przepis
      t.string :skladniki
      t.string :cena
      t.integer :trudnosc
      t.string :autor

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
