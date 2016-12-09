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
##populate blog because blogger is very active
  for i in 1..10
    on_page Create_BlogPost do |page|
      page.title = BetterLorem.w(10, true, true).gsub(/[^[a-zA-Z0-9]+]/, ' ').gsub(/\s+/, ' ')
      page.blog_body = BetterLorem.p(10, true, false).gsub(/[^[a-zA-Z0-9]+]/, ' ').gsub(/\s+/, ' ')
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
###populate comments
sleep 2
end

Then(/^then I should see a summary of my favorite blogger's (\d+) most recent posts in reverse order$/) do |arg1|
  on_page Blog_Home do |page|
    recent_posts = page.get_this_many_recent_posts(arg1)
    expect(reverse_order?(recent_posts)).to be true
  end
end

Then(/^I should see the blog post$/) do
  on_page Show_BlogPost do |page|
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
