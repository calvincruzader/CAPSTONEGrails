def fill_comments_with_other_readers(page)
  on_page Show_BlogPost do |page|
    page.logout
  end
  on_page Blog_Home do |page|
    page.goto_login
  end
  sleep 2
  on_page Login do |page|
    page.username = "An Interested Commentor"
    page.password = "user"
    page.login
  end
  sleep 2
  on_page Blog_Home do |page|
    page.choose_blog_post
  end
  on_page Show_BlogPost do |page|
    ##make a few comments
    for i in 0..3
      page.focus_on_commentBox
      page.commentBox = BetterLorem.w(20, true, false)
      page.comment
    end
  end
  on_page Show_BlogPost do |page|
    page.logout
  end
end
