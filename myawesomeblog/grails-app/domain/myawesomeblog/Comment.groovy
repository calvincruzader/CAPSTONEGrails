package myawesomeblog

class Comment {
    String author
    String body
    Date dateCreated

    static belongsTo = [post:Post]

    static mapping = {
      sort 'dateCreated':'desc'
    }

    static constraints = {
      body sqlType: 'text'
    }
}
