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
#  full_name       :string(255)
#  uid             :string(255)
#  provider        :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :full_name, :password, :password_confirmation, :is_admin, :is_teacher, :is_pro, :description, :uid, :provider, :remote_image_url

  has_secure_password
  # validates :email, :password_digest, :presence => true
  # validates :email, :uniqueness => true

  has_and_belongs_to_many :courses
  has_many :taught_courses, :class_name => 'Course', :foreign_key => 'teacher_id'
  has_many :notes, :through => :courses
  has_many :events

  mount_uploader :image, ImageUploader

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    user = User.new
    user.full_name = auth[:info][:name]
    user.uid = auth[:uid]
    user.provider = auth[:provider]
    user.remote_image_url = "http://bossymoksie.files.wordpress.com/2012/06/blank_avatar_220.png"

    pass = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join

    user.password = pass
    user.password_confirmation = pass
    user.save
    user
  end

  acts_as_voter

  acts_as_followable
  acts_as_follower
  
end
