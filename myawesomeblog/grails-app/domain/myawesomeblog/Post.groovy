package myawesomeblog

class Post {
	String title
	String body
	String author
	Date dateCreated

	static belongsTo = [author:User]
	static hasMany = [comments:Comment, posts: Post]

  static constraints = {
		title(blank: false)
		author(nullable: false)
		body(nullable: false)
		body sqlType: 'text'
  }
}
