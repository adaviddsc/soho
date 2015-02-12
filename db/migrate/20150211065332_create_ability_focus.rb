class CreateAbilityFocus < ActiveRecord::Migration
  def change
    create_table :ability_focus do |t|
      t.belongs_to :ability, index: true
      t.string :user, index: true
      t.timestamps
    end
  end
end
