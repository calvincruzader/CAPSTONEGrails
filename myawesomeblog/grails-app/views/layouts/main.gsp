<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script> -->
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'loginStyles.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'myCss.css')}" type="text/css">
    <g:layoutHead/>
</head>
<body>

    <div class="navbar navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <span ><sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_USER'>
                  <g:link class="btn btn-info logoutBtn" controller='logout'>Logout</g:link>
                </sec:ifAnyGranted></span>
              <span><sec:ifNotLoggedIn>

                <span id="loginButton"><g:link type="button" class="create btn btn-primary" action="login">Log in</g:link></span>
              </sec:ifNotLoggedIn></span>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/#">
                  BLOG UNDER CONSTRUCTION
                </a>
                <!-- <sec:ifLoggedIn>
                  <g:link class="btn" controller="logout" action="logout"><g:message code="btn.logout" default="Loading&hellip"/></g:link>
                </sec:ifLoggedIn> -->
            </div>
            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
                <ul class="nav navbar-nav navbar-right">
                    <g:pageProperty name="page.nav" />
                </ul>
            </div>
        </div>
    </div>
    <div class="footer" role="contentinfo"></div>


    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

    <g:form id="searchTitlesById" name="searchBlogs" url="[controller:'Post',action:'searchBlogs']">
      <div><span>Search By Title:</span>
        <g:textField name="searchText" id="searchText"></g:textField>
        <g:submitButton name="searchButton" class="btn btn-info" value="searchButton"/>
      </div>
    </g:form>

    <g:layoutBody/>
    <script>
    console.log(window.location.href);
    $(function toggleLoginButton() {
          if (window.location.href == "http://localhost:8080/login/auth") {
                $('#searchTitlesById').hide();
                $('#loginButton').hide();
          } else {
                $('#loginButton').show();
                $('#searchTitlesById').show();
          }
     });
    </script>


</body>
</html>
