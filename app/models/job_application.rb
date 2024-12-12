# == Schema Information
#
# Table name: job_applications
#
#  id                 :bigint           not null, primary key
#  personal_statement :text
#  resume             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  job_posting_id     :integer
#  user_id            :integer
#
class JobApplication < ApplicationRecord

belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
belongs_to :job_posting, required: true, class_name: "JobPosting", foreign_key: "job_posting_id", counter_cache: true
  
end
