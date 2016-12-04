package myawesomeblog

class Post {
	String title
	String body
	String author
	Date dateCreated

	static belongsTo = [author:User]
	static hasMany = [comments:Comment]

  static constraints = {
		title(black: false)
		author(nullable: true)
		body sqlType: 'text'
  }
}
