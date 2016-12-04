package myawesomeblog

// import SecUser;
// import SecRole;
// import SecUserSecRole;

class BootStrap {

    def init = { servletContext ->

      def adminRole = new SecRole(authority: 'ROLE_ADMIN').save()
      def userRole = new SecRole(authority: 'ROLE_USER').save()

      def testUser = new SecUser(username: 'me', password: 'password').save()

      SecUserSecRole.create testUser, adminRole

      SecUserSecRole.withSession {
       it.flush()
       it.clear()
      }

      assert SecUser.count() == 1
      assert SecRole.count() == 2
      assert SecUserSecRole.count() == 1
    }
    def destroy = {
    }
}
