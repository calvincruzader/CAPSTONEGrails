package myawesomeblog

class Post {
	String title
	String body
	String author
	Date dateCreated

	private static final BLOG_PREVIEW_MAX_CHARACTERS = 1000;

	static belongsTo = [author:User]
	static hasMany = [comments:Comment, posts: Post]

	static mapping = {
		sort dateCreated: "desc"
	}

  static constraints = {
		title(blank: false)
		author(nullable: false)
		body(nullable: false)
		body sqlType: 'text'
  }

	def blogBodyPreview() {
		String preview = body.take(BLOG_PREVIEW_MAX_CHARACTERS)
		if (preview.length() == BLOG_PREVIEW_MAX_CHARACTERS) {
			preview += "...";
		}
		return preview;
	}
}
