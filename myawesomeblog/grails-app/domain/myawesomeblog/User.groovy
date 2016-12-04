package myawesomeblog

class User {
	  static constraints = {
	    loginName(unique:true)
	    password(password:true)
	    username()
	  }

	  static hasMany = [entries:Post]

	  String loginName
	  String password
	  String username

	  String toString() {
	    username
	  }
}
