package myawesomeblog

import grails.test.mixin.*
import spock.lang.*

@TestFor(CommentController)
@Mock([Comment, Post])
class CommentControllerSpec extends Specification {

  def populateValidParams(params) {
    assert params != null
    params["title"] = "This is a title"
    params["body"] = "This is the body of a paragraph"
    params["author"] = "CalvinCruzader"
    params["dateCreated"] = new Date()
    params["comments"] = []
  }

  // @Transactional
  // def saveComment() {
  //   Post blogpost = Post.findByTitle(params.title)
  //   blogpost.addToComments(new Comment(author:params.author,body:params.body)).save()
  //   redirect(controller: "Post", action: "Show", id:blogpost.id)
  // }

  void "saveComment saves comments"() {

    //want valid instance of post and comment
    response.reset()
    populateValidParams(params)
    def post = new Post(params)

    

  }
}
