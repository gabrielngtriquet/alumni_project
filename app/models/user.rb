# == Schema Information
#
# Table name: users
#
#  id                        :bigint           not null, primary key
#  admin                     :boolean
#  alumn                     :boolean
#  city_of_residence         :string
#  company                   :string
#  country_of_residence      :string
#  dob                       :date
#  email                     :string           default(""), not null
#  encrypted_password        :string           default(""), not null
#  industry_of_occupation    :string
#  name                      :string
#  professor                 :boolean
#  profile_picture           :string
#  remember_created_at       :datetime
#  reset_password_sent_at    :datetime
#  reset_password_token      :string
#  sent_follow_request_count :integer
#  student                   :boolean
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many  :posts, class_name: "Post", foreign_key: "user_id", dependent: :destroy
         has_many  :job_applications, class_name: "JobApplication", foreign_key: "user_id", dependent: :destroy
         has_many  :job_postings, class_name: "JobPosting", foreign_key: "user_id", dependent: :destroy
         has_many  :likes, class_name: "Like", foreign_key: "user_id", dependent: :destroy
         has_many  :comments, class_name: "Comment", foreign_key: "user_id", dependent: :destroy
         has_many  :sent_follow_request, class_name: "FollowRequest", foreign_key: "sender_id", dependent: :destroy
         has_many  :received_follow_request, class_name: "FollowRequest", foreign_key: "recipient_id", dependent: :destroy

end
$$
