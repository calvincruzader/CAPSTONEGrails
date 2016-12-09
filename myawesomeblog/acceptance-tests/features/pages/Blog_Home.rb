class Blog_Home
  include PageObject

  page_url "http://localhost:8080/"

  link(:goto_login, :class => 'loginOrOutBtn')
  link(:goto_create_post, :class => "newPostBtn")
  div(:first_blogpost, :class => "blogPreview0")
  link(:choose_blog_post, :class => "blogShowLink")
  spans(:most_recent_post_dates, :class => "blogDate")
  text_field(:search_blog_post_titles, :id => "searchText")
  button(:search, :id => "searchButton")
  paragraphs(:blog_posts_search_results, :class =>"blogTitle")
  paragraph(:blog_preview, :class => "blogBodyPreview")

  def get_this_many_recent_posts(num)
    post_dates_to_return = []
    for i in 0..(num.to_i-1)
      post_dates_to_return.push(most_recent_post_dates_elements[i])
    end
    return post_dates_to_return
  end

end
