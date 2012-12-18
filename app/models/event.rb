# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  event      :string(255)
#  user_id    :integer
#  course_id  :integer
#  note_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :note
end
