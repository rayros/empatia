xml.instruct!
xml.rss :version => "2.0" do
  xml.channel do
      xml.title "Emaptia"
      xml.description "Daily funny pictures."
      xml.link posts_url

      feed_posts.each do |post|
        xml.item do
          xml.title post.title
          xml.description post.description
          xml.pubDate post.created_at.to_s(:rfc822)
          xml.link post_url(post)
          xml.guid post_url(post)
        end
      end
  end
end
