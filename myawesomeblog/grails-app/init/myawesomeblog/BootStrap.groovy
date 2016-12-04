package myawesomeblog

// import SecUser;
// import SecRole;
// import SecUserSecRole;

class BootStrap {

    def init = { servletContext ->

      def adminRole = new SecRole(authority: 'ROLE_ADMIN').save()
      def userRole = new SecRole(authority: 'ROLE_USER').save()

      def testAdmin = new SecUser(username: 'me', password: 'password').save()
      def testUser = new SecUser(username: 'user', password: 'user').save()

      SecUserSecRole.create testAdmin, adminRole
      SecUserSecRole.create testUser, userRole

      SecUserSecRole.withSession {
       it.flush()
       it.clear()
      }

      assert SecUser.count() == 2
      assert SecRole.count() == 2
      assert SecUserSecRole.count() == 2
    }
    def destroy = {
    }
}
