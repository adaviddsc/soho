class CreateJobBrowses < ActiveRecord::Migration
  def change
    create_table :job_browses do |t|
      t.belongs_to :job, index: true
      t.string :user
      t.timestamps
    end
  end
end
