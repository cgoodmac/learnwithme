# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  zip             :integer
#  image           :string(255)
#  is_admin        :string(255)
#  is_teacher      :string(255)
#  is_pro          :string(255)
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :full_name, :password, :password_confirmation, :is_admin, :is_teacher, :is_pro, :description

  has_secure_password
  # validates :email, :password_digest, :presence => true
  # validates :email, :uniqueness => true

  has_and_belongs_to_many :courses
  has_many :taught_courses, :class_name => 'Course', :foreign_key => 'teacher_id'
  mount_uploader :image, ImageUploader
end
