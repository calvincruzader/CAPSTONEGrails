Then(/^I should see comments left by other readers$/) do
  ##preprocessing##
  on_page Show_BlogPost do |page|
    fill_comments_with_other_readers(page)
  end
  sleep 3
  on_page Blog_Home do |page|
    page.choose_blog_post
  end
  sleep 2
  on_page Show_BlogPost do |page|
    expect(page.comment_by_another_reader).to include "An Interested Commentor"
  end
end

Given(/^I am reading a blog post from my favorite blogger$/) do
  visit_page Blog_Home
  on_page Blog_Home do |page|
    page.choose_blog_post
  end
  sleep 2
end

When(/^I add my genius comment to the blog post$/) do
  on_page Show_BlogPost do |page|
    @genius_comment = "Adding my genius comment."
    page.commentBox = @genius_comment
    page.comment
  end
end

Then(/^my genius comment is at the top of the blog post comments$/) do
  on_page Show_BlogPost do |page|
    expect(page.all_comments_elements.first.text).to include @genius_comment
  end
end
