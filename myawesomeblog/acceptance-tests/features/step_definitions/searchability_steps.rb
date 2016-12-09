Then(/^the url should contain information about the post$/) do
  on_page Show_BlogPost do |page|
    remove_percent_encoding_URL = @browser.url.gsub(/(%20)+/, ' ')
    expect(remove_percent_encoding_URL).to include page.blog_title
  end
end
