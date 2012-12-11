class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :is_admin, :is_teacher, :is_pro, :description

  has_secure_password
  validates :email, :password_digest, :presence => true
  validates :email, :uniqueness => true

  has_and_belongs_to_many :courses
  has_many :taught_courses, :class_name => 'Course', :foreign_key => 'teacher_id'
  mount_uploader :image, ImageUploader
end