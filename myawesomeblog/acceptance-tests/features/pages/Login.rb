class Login
  include PageObject

  text_field(:username, :id => "username")
  text_field(:password, :id => "password")
  button(:login, :id => "submit")


end
