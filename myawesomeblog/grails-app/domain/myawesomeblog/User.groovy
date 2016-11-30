package myawesomeblog

class User {
	  static constraints = {
	    login(unique:true)
	    password(password:true)
	    name()
	  }
	  
	  static hasMany = [entries:Post]
	  
	  String login
	  String password
	  String name
	  
	  String toString(){
	    name
	  }
}
