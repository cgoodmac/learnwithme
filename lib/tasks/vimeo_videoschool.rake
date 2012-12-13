namespace :vimeo_videoschool  do
  desc "get vimeo videoschool vids"
  task :getvideos => :environment do
    require 'open-uri' #require open-uri lets you do the open in the next line
    data = HTTParty.get('http://vimeo.com/api/v2/group/videoschool/videos.json')
    
    data.each do |entry|
      title = entry["title"]
      description = entry["description"]
      video_link = entry["url"].gsub('http://vimeo.com/','http://player.vimeo.com/video/')
      thumbnail = entry["thumbnail_medium"]
      full_name = entry["user_name"]

      u = User.create(:is_teacher => "on", :email => "cgoodmac@gmail.com", :full_name => full_name, :password => "1", :password_confirmation => "1")

      c = Course.create(:title => title, :description => description, :price => 0, :remote_image_url => thumbnail )
    
      v = Video.create(:title => title, :description => description, :link => video_link )
      
      c.teacher_id = u.id

      c.save
      
      c.videos << v
    end
 end
end
