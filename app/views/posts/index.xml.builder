xml.instruct!
xml.posts do
  accepted_posts.each do |post|
    xml.post do
      xml.id post.id
      xml.title post.title
      xml.description post.description
      xml.img do
        xml.file do
          xml.name post.picture_file_name
          xml.size post.picture_file_size
        end
        xml.url do
          xml.default post.picture.url(:default)
          xml.thumb post.picture.url(:thumb)
        end
      end
    end
  end
end
