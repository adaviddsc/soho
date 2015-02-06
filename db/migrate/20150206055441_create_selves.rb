class CreateSelves < ActiveRecord::Migration
  def change
    create_table :selves do |t|
      t.belongs_to :user, index: true
  	  t.string :avatar
      t.string :name
      t.string :cellphone
      t.string :sex
      t.date :birth
      t.string :marriage
      t.string :workStatus
      t.string :education
      t.timestamps
    end
  end
end
