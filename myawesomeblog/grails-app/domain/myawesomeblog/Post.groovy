package myawesomeblog

class Post {
	String title
	String body
	String author
	String searchQuery
	Date dateCreated

	static belongsTo = [author:User]
	static hasMany = [comments:Comment]

  static constraints = {
		searchQuery(nullable: true)
		title(black: false)
		author(nullable: true)
		body sqlType: 'text'
  }
}
