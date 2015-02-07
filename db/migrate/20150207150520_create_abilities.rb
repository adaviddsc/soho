class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.belongs_to :user, index: true
      t.string :workCategory
      t.text :abilityContent
      t.text :abilityDetail
      t.timestamps
    end
  end
end
