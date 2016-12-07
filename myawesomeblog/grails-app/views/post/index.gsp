  <!DOCTYPE html>
  <html>
      <head>
          <meta name="layout" content="main" />
          <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
          <title><g:message code="default.list.label" args="[entityName]" /></title>
      </head>
      <body>
          <a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
          <div class="newPostLocation container" role="navigation">
              <ul>

                  <sec:ifAnyGranted roles='ROLE_ADMIN'>
                    <li><g:link type="button" class="col-xs-1 col-xs-offset-11 btn btn-primary newPostBtn" action="create">New Post</g:link></li>
                  </sec:ifAnyGranted>
              </ul>
          </div>

          <div id="list-post" class="content scaffold-list container col-xs-12" role="main">
              <h1 class="blogHomeTitle">A Collection of Some of My Musings</h1><br><hr><br>
              <g:if test="${flash.message}">
                  <div class="message" role="status">${flash.message}</div>
              </g:if>
                <g:each class="blogListPreview" in="${this.postList?.reverse()}" name="defaultList" var="post" status="i">

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
                  </g:each>
                  <g:if test="${postCount > 10}">
                    <div id="pagination" class="pagination">
                      <g:paginate total="${postCount ?: 0}" />
                    </div>
                  </g:if>
          </div>


      </body>
  </html>
