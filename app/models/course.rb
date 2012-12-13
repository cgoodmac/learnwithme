# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  price       :float
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  teacher_id  :integer
#

class Course < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :ebooks
  has_and_belongs_to_many :audios
  
  belongs_to :teacher, :class_name => 'User', :foreign_key => 'teacher_id'
  mount_uploader :image, ImageUploader
end
