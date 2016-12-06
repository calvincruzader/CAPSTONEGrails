<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="col-xs-12 " role="navigation">
          <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_USER'>
            <g:link controller='logout'>Logout</g:link>
          </sec:ifAnyGranted>
            <ul>
                <sec:ifNotLoggedIn>
                  <li><g:link type="button" class="create btn btn-primary col-xs-offset-10 col-xs-1" action="create">Log in!</g:link></li>
                </sec:ifNotLoggedIn>
                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                  <li class="col-xs-offset-10 col-xs-2"><g:link type="button" class="create btn btn-primary" action="create">New Post!</g:link></li>
                </sec:ifAnyGranted>
            </ul>
        </div>

        <div id="list-post" class="content scaffold-list container col-xs-12" role="main">
            <h1>Bringing home the bacon ipsum</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form name="searchBlogs" url="[controller:'Post',action:'searchBlogs']">
              <div><span>Search By Title:</span>
                <g:textField name="searchText" id="searchText" params="${[searchText: searchText]}"></g:textField>
              </div>
              <g:submitButton id="aTest" class="btn btn-info" value="searchButton" name="searchButton"/>
            </g:form>

              <g:each in="${this.postList?.reverse()}" name="defaultList" var="post" status="i">

                <g:link mapping="searchEngineFriendlyURL" params='[title: "${post.title}"]' id="${post.id}">
                  <p><strong class="blogTitle col-xs-12">${post.title}</strong></p>
                </g:link>
                  <p class="col-xs-10">${post.body}</p>
                  <br/>
                  <p class="col-xs-offset-10 col-xs-2">-${post.author}</p>
                  <p class="col-xs-offset-10 col-xs-2">${post.dateCreated}</p>
                  <hr>
                </g:each>
            <div class="pagination container">
                <g:paginate total="${postCount ?: 0}" />
            </div>
        </div>

    </body>
</html>
