class Show_BlogPost
  include PageObject

  div(:blogpost_notification, :class => "message")
  link(:home_page, :class => "home")
  link(:goto_create_post, :class => "create")
  link(:logout, :class => "loginOrOutBtn")
  div(:blog_post, :class =>"blogPostShow")
  text_area(:commentBox, :id => "commentCreate")
  button(:comment, :id => "makeComment")
  div(:comment_by_another_reader, :class => "oneComment")
  divs(:all_comments, :class => "oneComment")
  div(:blog_title, :class => "theBlogTitle")
  link(:goto_login, :class => 'loginOrOutBtn')

  def focus_on_commentBox
    @browser.textarea(:id => "commentCreate").send_keys :backspace
  end

  def test
    byebug
  end
end
