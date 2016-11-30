<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-post" class="content scaffold-list container col-xs-12" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${postList}" />
            <g:each in="${postList}">
              <p><strong class="blogTitle">${it.title}</strong></p>
              <p>${it.body}</p>
              <br/>
              <p class="col-xs-offset-11 col-xs-1">${it.dateCreated}</p>
              <hr>
            </g:each>
            <div class="pagination">
                <g:paginate total="${postCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
