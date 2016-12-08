Then(/^the url should contain information about the post$/) do
  on_page Show_BlogPost do |page|

    human_friendly_URL = @browser.url.gsub(/%20/, ' ')
    expect(human_friendly_URL).to include page.blog_title
  end
end
