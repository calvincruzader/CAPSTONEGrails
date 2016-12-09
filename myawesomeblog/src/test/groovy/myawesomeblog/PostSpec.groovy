package myawesomeblog

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Post)
class PostSpec extends Specification {

    Post post;
    private static final String LONG_BLOGPOST_BODY_PREVIEW = 'aaa'.multiply(400)

    def setup() {
    }

    def cleanup() {
    }

    void "blogBodyPreview returns the correct format"() {
      when:"The number of characters in the blogpost body is less than 1000 characters"
        post = new Post(title: 'the best title', body: 'Words words words', author: 'Calvin', dateCreated: new Date())

      then:
        post.blogBodyPreview() == "Words words words"

      when:"The number of characters in the blogpost body is MORE than 1000 character"
        post = new Post(title: 'the best title', body: LONG_BLOGPOST_BODY_PREVIEW, author: 'Calvin', dateCreated: new Date())

      then:
        post.blogBodyPreview() == LONG_BLOGPOST_BODY_PREVIEW.substring(0,1000) + "..."
    }
}
