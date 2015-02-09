class CreateJobImgs < ActiveRecord::Migration
  def change
    create_table :job_imgs do |t|
      t.belongs_to :job, index: true
      t.integer :order
      t.string :image
      t.timestamps
    end
  end
end
