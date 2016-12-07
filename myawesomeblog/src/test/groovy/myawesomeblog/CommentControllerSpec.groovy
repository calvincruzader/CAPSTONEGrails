package myawesomeblog

import grails.test.mixin.*
import spock.lang.*

@TestFor(CommentController)
@Mock(Comment)
class CommentControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        params["author"] = 'Person1'
        params["body"] = "This is the body of the comment"
        params["dateCreated"] = new Date();

    }

}
