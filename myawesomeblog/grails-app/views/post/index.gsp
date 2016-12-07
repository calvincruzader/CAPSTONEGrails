  <!DOCTYPE html>
  <html>
      <head>
          <meta name="layout" content="main" />
          <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
          <title><g:message code="default.list.label" args="[entityName]" /></title>
      </head>
      <body>
          <div class="titleAndNewPostBtn container"><span class="blogHomeTitle">A Collection of Some of My Musings</span>
            <sec:ifAnyGranted roles='ROLE_ADMIN'>
              <g:link type="button" class="btn btn-primary newPostBtn pull-right" action="create">New Post</g:link></li>
            </sec:ifAnyGranted>
          </div><br><hr><br>

          <div id="list-post" class=" scaffold-list container col-xs-12" role="main">

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:each in="${this.postList?}" name="defaultList" var="post" status="i">
              <div class="blogPreview${i}">
                <g:link mapping="searchEngineFriendlyURL" params='[title: "${post.title}"]' id="${post.id}">
                  <p><strong class="blogTitle col-xs-10">${post.title}</strong></p>
                </g:link>
                <p class="col-xs-10">${post?.blogBodyPreview()}
                  <br/>
                  <p class="col-xs-2">-${post.author}</p>
                  <p class="col-xs-2 pull-right"><g:formatDate format="yyyy-MM-dd HH:mm" date="${post.dateCreated}"/></p>
                </p>
                <br><br><br><br><br><br><br>
                <hr>
              </div>
            </g:each>
            <g:if test="${postCount > 10}">
              <div id="pagination" class="pagination">
                <g:paginate total="${postCount ?: 0}" />
              </div>
            </g:if>
          </div>
      </body>
  </html>
