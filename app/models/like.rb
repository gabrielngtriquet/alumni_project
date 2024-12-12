# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class Like < ApplicationRecord

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id" 
  belongs_to :post, required: true, class_name: "Post", foreign_key: "post_id"
  
end
