class CreateAbilityImgs < ActiveRecord::Migration
  def change
    create_table :ability_imgs do |t|
      t.belongs_to :ability, index: true
      t.integer :order
      t.string :image
      t.timestamps
    end
  end
end
