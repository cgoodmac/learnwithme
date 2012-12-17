# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  subject    :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  user_id    :integer
#

class Note < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
end
