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
            <ul>
                <sec:ifNotLoggedIn>
                  <li><g:link type="button" class="create btn btn-primary col-xs-offset-10 col-xs-1" action="create">Login!</g:link></li>
                </sec:ifNotLoggedIn>
                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                  <li class="col-xs-offset-10 col-xs-2"><g:link type="button" class="create btn btn-danger" action="create">NEW BACON</g:link></li>
                </sec:ifAnyGranted>
            </ul>
        </div>

        <div id="list-post" class="content scaffold-list container col-xs-12" role="main">
            <h1>Bringing home the bacon ipsum</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:each status="i" in="${postList?.reverse()}" var="post">
              <g:link controller="post" action="show" id="${post.id}">
                <p><strong class="blogTitle col-xs-12">${post.title}</strong></p>
              </g:link>
                <p class="col-xs-10">${post.body}</p>
                <br/>
                <p class="col-xs-offset-10 col-xs-2">-${post.author}</p>
                <p class="col-xs-offset-10 col-xs-2">${post.dateCreated}</p>
                <hr>
            </g:each>
            <g:link mapping="testMap"></g:link>
            <div class="pagination container">
                <g:paginate total="${postCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
