  <!DOCTYPE html>
  <html>
      <head>
          <meta name="layout" content="main" />
          <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
          <title><g:message code="default.list.label" args="[entityName]" /></title>
      </head>
      <body>
          <a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
          <div class="container" role="navigation">
              <ul>

                  <sec:ifAnyGranted roles='ROLE_ADMIN'>
                    <li><g:link type="button" class="col-xs-1 col-xs-offset-11 btn btn-primary newPostBtn" action="create">New Post</g:link></li>
                  </sec:ifAnyGranted>
              </ul>
          </div>

          <div id="list-post" class="content scaffold-list container col-xs-12" role="main">
              <h1>Blog Home Page</h1>
              <g:if test="${flash.message}">
                  <div class="message" role="status">${flash.message}</div>
              </g:if>
                <g:each class="blogListPreview" in="${this.postList?.reverse()}" name="defaultList" var="post" status="i">

                  <g:link mapping="searchEngineFriendlyURL" params='[title: "${post.title}"]' id="${post.id}">
                    <g:if test="${this.searchText != null}">
                      <p><strong class="blogTitle col-xs-10">${post.title}</strong></p>
                    </g:if>
                    <g:else>
                      <p><strong class="blogTitle col-xs-10">${post.title}</strong></p>
                    </g:else>
                  </g:link>
                    <p class="col-xs-10">${post?.blogBodyPreview()}
                      <br/>
                      <p class="col-xs-2">-${post.author}</p>
                      <p class="col-xs-2 pull-right"><g:formatDate format="yyyy-MM-dd HH:mm" date="${post.dateCreated}"/></p>
                    </p>
                    <br><br><br><br><br><br><br>
                    <hr>
                  </g:each>
              <div id="pagination" class="pagination">
                  <g:paginate total="${postCount ?: 0}" />
              </div>
          </div>


      </body>
  </html>
