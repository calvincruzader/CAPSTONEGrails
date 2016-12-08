Given(/^I am logged in as a blogger$/) do
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
end

When(/^I publish a new blog post$/) do
  sleep 2
  on_page Blog_Home do |page|
    page.goto_create_post
  end
  sleep 2
  on_page Create_BlogPost do |page|
    @title = BetterLorem.w(10, true, true)
    page.title = @title
    page.blog_body = BetterLorem.p(10, true, false)
    page.create_blogpost
    sleep 2
  end
end

Then(/^I am notified that the blog post was successfully added$/) do
  on_page Show_BlogPost do |page|
    expect(page.blogpost_notification).to include(@title, "created")
    page.home_page
    sleep 2
  end
end

Then(/^the newly added blog post is at the top of the recent posts list$/) do
  #check that the blog post at the top of the recent posts list
  on_page Blog_Home do |page|
    expect(page.first_blogpost).to include(@title)
  end
end
