# == Schema Information
#
# Table name: audios
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  audio_file :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Audio < ActiveRecord::Base
  has_and_belongs_to_many :courses

  mount_uploader :audio_file, AudioUploader
end
