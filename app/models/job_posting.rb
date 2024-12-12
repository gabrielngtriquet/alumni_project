# == Schema Information
#
# Table name: job_postings
#
#  id                     :bigint           not null, primary key
#  company                :string
#  compensation           :string
#  job_applications_count :integer
#  sector_of_occupation   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#
class JobPosting < ApplicationRecord

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :job_applications, class_name: "JobApplication", foreign_key: "job_posting_id", dependent: :destroy

  
end
