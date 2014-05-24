xml.instruct!
xml.instruct! 'xml-stylesheet', {:href => asset_url('index.xsl'), :type=>'text/xsl'}
xml.posts 'xmlns:xsi'=>'http://www.w3.org/2001/XMLSchema-instance', 'xsi:noNamespaceSchemaLocation' => asset_url('index.xsd')  do
  posts.each do |post|
    xml.post do
      xml.id post.id
      xml.title post.title
      xml.description post.description
      xml.comment_count post.comment_count
      xml.like_count post.like_count
      xml.share_count post.share_count
      xml.total_count post.total_count
      xml.url post_url(post)
      xml.img do
        xml.file do
          xml.name post.picture_file_name
          xml.size post.picture_file_size
        end
        xml.url do
          xml.original post.picture.url
          xml.default post.picture.url(:default)
          xml.thumb post.picture.url(:thumb)
        end
      end
    end
  end
end
