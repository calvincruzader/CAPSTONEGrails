class Blog_Home
  include PageObject

  page_url "http://localhost:8080/"

  link(:goto_login, :class => 'loginOrOutBtn')
  link(:goto_create_post, :class => "newPostBtn")
  div(:first_blogpost, :class => "blogPreview0")
  link(:choose_blog_post, :class => "blogShowLink")
  spans(:ten_most_recent_post_dates, :class => "blogDate")
  text_field(:search_blog_post_titles, :id => "searchText")
  button(:search, :id => "searchButton")
  paragraphs(:blog_posts_search_results, :class =>"blogTitle")
  paragraph(:blog_preview, :class => "blogBodyPreview")

end
