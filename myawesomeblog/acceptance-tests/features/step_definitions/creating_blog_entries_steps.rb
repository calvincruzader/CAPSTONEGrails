Given(/^I am logged in as a blogger$/) do
  visit_page Blog_Home
  on_page Blog_Home do |page|
    page.goToLoginPage
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
    page.makeNewPost
  end
  sleep 2
  on_page Create_BlogPost do |page|
    @title = "First awesome new blog post"
    page.title = @title
    page.blog_body ="Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque justo purus, hendrerit" +
    "vel erat molestie, bibendum ornare ex. Etiam ac diam dictum, ultricies nisi vel, suscipit metus. Praesent tempus, magna eu"+
    "tempor euismod, nisi sapien tincidunt sapien, sit amet feugiat sapien mauris eget ipsum. Curabitur dapibus lacus a varius" +
    "blandit. Vivamus a tortor eget sem bibendum volutpat. Morbi consequat tortor at commodo blandit. Quisque ornare pharetra"+
    "purus eu tempus. Aliquam lacinia urna est, eu mollis turpis euismod mattis. Donec fermentum malesuada quam, et interdum purus"+
     "efficitur et.Duis eu metus ac nibh cursus placerat et at arcu. Praesent faucibus felis ut felis e"
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
