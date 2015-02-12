class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.belongs_to :user, index: true
  	  t.string :workCompany
      t.integer :workCompany_privicy
      t.date :workStart
      t.date :workEnd
      t.integer :workStartEnd_privicy
      t.integer :workSalary
      t.integer :workSalary_privicy
      t.string :workCategory
      t.string :workStyle
      t.integer :workStyle_privicy
      t.text :workExperience
      t.integer :workExperience_privicy
      t.timestamps
    end
  end
end
