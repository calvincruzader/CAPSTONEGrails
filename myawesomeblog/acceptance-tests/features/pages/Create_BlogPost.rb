class Create_BlogPost
  include PageObject

  page_url "http://localhost:8080/post/create"

  text_field(:title, :name => "title")
  text_area(:blog_body, :name => "body")
  button(:create_blogpost, :id => "create")

end
