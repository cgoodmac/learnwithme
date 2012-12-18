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
  has_many :notes, :through => :users

  has_and_belongs_to_many :videos
  has_and_belongs_to_many :ebooks
  has_and_belongs_to_many :audios
  has_and_belongs_to_many :categories
  
  has_many :events

  belongs_to :teacher, :class_name => 'User', :foreign_key => 'teacher_id'

  mount_uploader :image, ImageUploader

  def self.text_search(query)
    self.where("title @@ :q or description @@ :q or image @@ :q", :q => query)
  end

  acts_as_voteable
  
end
