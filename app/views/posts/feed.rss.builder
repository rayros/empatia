xml.instruct!
xml.rss :version => "2.0", 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
      xml.title "Emaptia"
      xml.description "Daily funny pictures."
      xml.link posts_url
      xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => feed_posts_url(format: 'rss')
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
