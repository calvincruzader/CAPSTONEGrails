package myawesomeblog

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CommentController {

    @Transactional
    def saveComment() {
      Post blogpost = Post.findByTitle(params.title)
      blogpost.addToComments(new Comment(author:params.author,body:params.body)).save()
      redirect(controller: "Post", action: "Show", id:blogpost.id)
    }
}
