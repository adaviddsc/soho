class CreateSelves < ActiveRecord::Migration
  def change
    create_table :selves do |t|
      t.belongs_to :user, index: true
  	  t.string :avatar
      t.string :bgimg
      t.string :name
      t.integer :name_privicy
      t.string :cellphone
      t.integer :cellphone_privicy
      t.string :sex
      t.integer :sex_privicy
      t.date :birth
      t.integer :birth_privicy
      t.string :marriage
      t.integer :marriage_privicy
      t.string :workStatus
      t.integer :workStatus_privicy
      t.string :education
      t.integer :education_privicy

      
      t.timestamps
    end
  end
end
