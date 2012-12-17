namespace :youtube  do
  desc "get youtube vids"
  task :getvideos => :environment do

    require 'open-uri'
    doc = Nokogiri::XML(open('http://gdata.youtube.com/schemas/2007/educategories.cat'))
    client = YouTubeIt::OAuth2Client.new(client_id: "110762796595.apps.googleusercontent.com", client_secret: "-quVKnjA9YCumLaassGVNQWi", dev_key: "AIzaSyAFBgGASF4pLvy0zdapp_EhbmAfimcEQQA")

    doc.children[0].children.each do |cat_obj|

      cat_name = cat_obj.attributes["label"].value
      category = Category.where(:name => cat_name).first

      if category.nil?
        category = Category.create(:name => cat_name, :page => 1)   
      end
      
      cat_sym = category.name.to_sym

      query = client.videos_by(:categories => [cat_sym], :duration => "long", :max_results => 50, :users => {:exclude => ['khanacademy']}, :per_page => 50, :page => category.page)

      query.videos.each do |entry|
        title = entry.title

        course = Course.where(:title => title).first

        if course.nil?
          full_name = entry.author.name 

          u = User.where(:full_name => full_name).first

          if u.nil?
            u = User.create(:is_teacher => "on", :email => "cgoodmac@gmail.com", :full_name => full_name, :password => "1", :password_confirmation => "1", :remote_image_url => "http://bossymoksie.files.wordpress.com/2012/06/blank_avatar_220.png")
          end

          description = entry.description
          unique_id = entry.unique_id
          video_link = "http://www.youtube.com/embed/#{unique_id}"
          duration = entry.duration
          thumbnail = entry.thumbnails[3].url
          thumbnail_size = FastImage.size(thumbnail)

          if thumbnail_size.first < 200 || thumbnail_size.second < 200
            thumbnail = "http://www.blogcdn.com/www.engadget.com/media/2011/12/youtubeedu121211.png"
          end

          c = Course.create(:title => title, :description => description, :price => 0, :remote_image_url => thumbnail )
        
          v = Video.create(:title => title, :description => description, :link => video_link, :duration => duration )
          
          c.teacher_id = u.id
          
          c.videos << v

          category.courses << c

          c.save
        end
      end
      
      category.page = category.page + 1
      category.save

    end
  end
end