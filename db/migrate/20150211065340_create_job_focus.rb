class CreateJobFocus < ActiveRecord::Migration
  def change
    create_table :job_focus do |t|
      t.belongs_to :job, index: true
      t.string :user, index: true
      t.timestamps
    end
  end
end
