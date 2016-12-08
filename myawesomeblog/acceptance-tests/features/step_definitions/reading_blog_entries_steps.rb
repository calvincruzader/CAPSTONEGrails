Given(/^my favorite blogger has been very active$/) do
  visit_page Blog_Home
  on_page Blog_Home do |page|
    page.goto_login
  end
  sleep 2
  on_page Login do |page|
    page.username = "CalvinCruzader"
    page.password = "password"
    page.login
  end
  sleep 2

  on_page Blog_Home do |page|
    page.goto_create_post
  end
  sleep 2

  ##populate blog
  for i in 1..10
    on_page Create_BlogPost do |page|
      @title =  BetterLorem.w(10, true, true)
      page.title = @title
      page.blog_body = BetterLorem.p(10, true, false)
      page.create_blogpost
    end
      sleep 2
    on_page Show_BlogPost do |page|
      page.goto_create_post
    end
      sleep 2
  end
  on_page Show_BlogPost do |page|
    page.logout
   end
  sleep 2
end

Then(/^then I should see a summary of my favorite blogger's (\d+) most recent posts in reverse order$/) do |arg1|
  on_page Blog_Home do |page|
    date_more_recent = ""
    date_less_recent = ""
    page.ten_most_recent_post_dates_elements.each do |post_date|
      if (date_more_recent == "")
        date_more_recent = post_date.text
        next
      elsif (date_less_recent == "")
        date_less_recent = post_date.text
      end
      expect(date_more_recent).to be >= date_less_recent
    end
  end
end

Then(/^I should see the blog post$/) do
  on_page Show_BlogPost do |page|
    byebug
    expect(page.blog_post).to include @blog_portion.chomp('...')
    page.home_page
    sleep 2
  end
end

When(/^I search for a blog post$/) do
  @search_query = "non"
  on_page Blog_Home do |page|
    page.search_blog_post_titles = @search_query
    page.search
    sleep 2
  end
end

Then(/^I should see posts with that value in the title$/) do
  on_page Blog_Home do |page|
    page.blog_posts_search_results_elements.each do |post_title|
      expect(post_title.text.downcase).to include(@search_query.downcase)
    end
  end
end
