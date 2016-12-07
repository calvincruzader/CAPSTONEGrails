class Show_BlogPost
  include PageObject

  div(:blogpost_notification, :class => "message")
  link(:home_page, :class => "home")

end
