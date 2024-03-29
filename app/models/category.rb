# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page       :integer
#

class Category < ActiveRecord::Base
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :users
end
