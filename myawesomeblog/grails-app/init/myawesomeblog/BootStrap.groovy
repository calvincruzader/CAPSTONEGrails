package myawesomeblog

// import SecUser;
// import SecRole;
// import SecUserSecRole;

class BootStrap {

    def init = { servletContext ->

      def adminRole = new SecRole(authority: 'ROLE_ADMIN').save()
      def userRole = new SecRole(authority: 'ROLE_USER').save()

      def testAdmin = new SecUser(username: 'CalvinCruzader', password: 'password').save()
      def testUser = new SecUser(username: 'user', password: 'user').save()
      def testUser2 = new SecUser(username: 'An Interested Commentor', password: 'user').save()

      SecUserSecRole.create testAdmin, adminRole
      SecUserSecRole.create testUser, userRole
      SecUserSecRole.create testUser2, userRole

      SecUserSecRole.withSession {
       it.flush()
       it.clear()
      }

      assert SecUser.count() == 3
      assert SecRole.count() == 2
      assert SecUserSecRole.count() == 3
    }
    def destroy = {
    }
}
