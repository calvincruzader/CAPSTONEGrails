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
        <div class="myContainer">
          <g:form id="searchTitlesById" name="searchBlogs" url="[controller:'Post',action:'searchBlogs']">
          </g:form>
            <div>
                <span ><sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_USER'>
                  <g:link class="btn btn-default loginOrOutBtn col-xs-2" controller='logout'>Logout</g:link>
                </sec:ifAnyGranted></span>
              <span><sec:ifNotLoggedIn>
                <span id="loginButton"><g:link type="button" class="create btn btn-default loginOrOutBtn col-xs-2" action="login">Log in</g:link></span>
              </sec:ifNotLoggedIn></span>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/#">
                  Calvin's Blog
                </a>
                <div></div>
                <g:form name="searchBlogs" url="[action:'searchBlogs',controller:'Post']">
                  <span>
                    <g:textField class="searchTextGroup col-xs-5" name="searchText" id="searchText"></g:textField>
                    <g:submitButton class="searchTextGroup" name="searchButton" class="btn btn-info searchBtn" value="search"/>
                  </span>
                </g:form>
            </div>
        </div>
    </div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

    <hr>


    <g:layoutBody/>
    <script>
    $(function toggleLoginButton() {
          if (window.location.href == "http://localhost:8080/login/auth" || window.location.href == "http://localhost:8080/login/auth?login_error=1") {
                $('#searchTitlesById').hide();
                $('#loginButton').hide();
          } else {
                $('#loginButton').show();
                $('#searchTitlesById').show();
          }
     });
    </script>

    <div class="footer" role="contentinfo"></div>
</body>
</html>
