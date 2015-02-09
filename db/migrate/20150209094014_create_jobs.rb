class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :user, index: true
      t.string :workCategory
      t.text :jobContent
      t.text :jobDetail
      t.timestamps
    end
  end
end
