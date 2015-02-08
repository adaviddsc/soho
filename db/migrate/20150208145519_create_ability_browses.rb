class CreateAbilityBrowses < ActiveRecord::Migration
  def change
    create_table :ability_browses do |t|
      t.belongs_to :ability, index: true
      t.string :user
      t.timestamps
    end
  end
end
