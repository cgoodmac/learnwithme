# == Schema Information
#
# Table name: ebooks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  ebook_file  :string(255)
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Ebook < ActiveRecord::Base
  has_and_belongs_to_many :courses

  mount_uploader :ebook_file, EbookUploader
  mount_uploader :image, ImageUploader
end
