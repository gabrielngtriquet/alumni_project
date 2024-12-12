class CreateJobPostings < ActiveRecord::Migration[7.1]
  def change
    create_table :job_postings do |t|
      t.string :company
      t.string :sector_of_occupation
      t.string :compensation
      t.integer :user_id
      t.integer :job_applications_count

      t.timestamps
    end
  end
end
