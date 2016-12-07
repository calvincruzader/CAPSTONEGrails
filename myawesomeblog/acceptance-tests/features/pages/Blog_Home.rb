class Blog_Home
  include PageObject

  page_url "http://localhost:8080/"

  link(:loginBtn, :class => 'loginOrOutBtn')
  link(:create_new_post, :class => "newPostBtn")
  div(:first_blogpost, :class => "blogPreview0")

  def goToLoginPage
    loginBtn
  end

  def makeNewPost
    create_new_post
  end

  def test
    byebug
  end
end
