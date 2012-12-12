class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :videos
  belongs_to :teacher, :class_name => 'User', :foreign_key => 'teacher_id'
  mount_uploader :image, ImageUploader
end