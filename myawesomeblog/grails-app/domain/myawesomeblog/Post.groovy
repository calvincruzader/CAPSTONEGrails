package myawesomeblog

class Post {
	String title
	String body
	String author
	Date dateCreated

	static belongsTo = [author:User]

  static constraints = {
		body sqlType: 'VARCHAR(10000)'
  }
}
