namespace :youtube_edu do
  desc "get youtube edu videos"
  task :getedu => :environment do
    require 'open-uri'
    doc = Nokogiri::XML(open('http://gdata.youtube.com/schemas/2007/educategories.cat'))

    catid_array = []

    doc.children[0].children.each do |cat_obj|
      # cat_name = cat_obj.attributes["label"].value
      cat_id = cat_obj.attributes["term"].value
      catid_array << cat_name
    end

    catid_array.each do |cat_id|
      videos = Nokogiri::XML(open("http://gdata.youtube.com/feeds/api/edu/lectures?category=#{category}"))
    end
    binding.pry
  end
end