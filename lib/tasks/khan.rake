namespace :khan  do
  desc "get khan academy vids"
  task :getvideos => :environment do
    playlists = HTTParty.get('http://www.khanacademy.org/api/v1/playlists')
    playlists.each do |playlist|

      category_name = playlist["community_questions_title"]
      playlist_id = playlist["id"]

      category = Category.where(:name => category_name).first

      if category.nil?
        category = Category.create(:name => category_name)
      end

      videos = HTTParty.get("http://www.khanacademy.org/api/v1/topic/#{playlist_id}/videos")

      videos.each do |video|
        title = video["title"]
        course = Course.where(:title => title).first

          if course.nil?

            author_name = video["author_names"].first

            u = User.where(:full_name => author_name).first

            if u.nil?
              u = User.create(:is_teacher => "on", :email => "cgoodmac@gmail.com", :full_name => author_name, :password => "1", :password_confirmation => "1", :remote_image_url => "http://trikeapps.com/assets/60/screenshot-large-khan.png" )
            end  

            youtube_id = video["youtube_id"]
            description = video["description"]
            video_link = "http://www.youtube.com/embed/#{youtube_id}"
            duration = video["duration"]

            c = Course.create(:title => title, :description => description, :price => 0, :remote_image_url => "http://mbleile.files.wordpress.com/2012/05/khan-academy1.png")
          
            v = Video.create(:title => title, :description => description, :link => video_link, :duration => duration )
            
            c.teacher_id = u.id
            
            c.videos << v

            category.courses << c

            c.save

            e = Event.create(:event => "created a course", :user_id => u.id, :course_id => c.id)

          end

      end

    end 
  end
end