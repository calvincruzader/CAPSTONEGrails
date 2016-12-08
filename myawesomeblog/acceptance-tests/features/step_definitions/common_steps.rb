When(/^I visit the blog for my favorite blogger$/) do
  visit_page Blog_Home
  on_page Blog_Home do |page|
     page.goto_login
  end
  sleep 2
  on_page Login do |page|
    page.username = "user"
    page.password = "user"
    page.login
  end
  sleep 2
end

When(/^I choose a blog post$/) do
  on_page Blog_Home do |page|
    @blog_portion = page.blog_preview
    sleep 2
    page.choose_blog_post
  end
  sleep 2
end
