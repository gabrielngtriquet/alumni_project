# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  comments_count :integer
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Post < ApplicationRecord


belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
has_many  :comments, class_name: "Comment", foreign_key: "post_id", dependent: :destroy
has_many  :likes, class_name: "Like", foreign_key: "post_id", dependent: :destroy

end
