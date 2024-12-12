class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications do |t|
      t.text :personal_statement
      t.string :resume
      t.integer :user_id
      t.integer :job_posting_id

      t.timestamps
    end
  end
end
