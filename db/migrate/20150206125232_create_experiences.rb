class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.belongs_to :user, index: true
  	  t.string :workCompany
      t.date :workStart
      t.date :workEnd
      t.integer :workSalary
      t.string :workCategory
      t.string :workStyle
      t.text :workExperience
      t.timestamps
    end
  end
end
