<!DOCTYPE html>
<html>
    <head>
        <!-- <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script> -->
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>

          <g:form resource="${this.post}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${this.post}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
          </g:form>
        </div>
        <div id="show-post" class="content scaffold-show" role="main">
            <h1>SHOWING A WONDERFUL POST </h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="container">
              <h2 class="col-xs-12">${post.title}</h2>
              <p class="col-xs-12">${post.body}</p>
              <p class="col-xs-2 col-xs-offset-10">${post.author}</p>
              <p class="col-xs-2 col-xs-offset-10">${post.dateCreated}</p>
            </div>
            <div class = "container">
              <fieldset>
                <hr>
                <div class="commentDisplay"></div>
                <hr>
                <g:each in="${(this.post.comments.sort {it.dateCreated}).reverse()}">
                  <div class="">
                    <span>
                      <h5><strong>${it.author}</strong></h5>
                    </span>
                  </div>
                  <div class="">${it.body}</div>
                  <span class="pull-right">
                    <h5>Posting date: ${it.dateCreated}</h5>
                  </span>
                  <br>
                  <hr>
                </g:each>
            </div>
                <hr>
                <div class="container">
                  <g:formRemote action="saveComment" controller="Comment" name="saveComment" url="[controller:'Comment',action:'saveComment']">
                    <div class="col-xs-12"><span class="col-xs-2">Leave a comment!</span>
                      <g:textArea name="body" params="${[body: body]}" class="col-xs-4" id="commentCreate"></g:textArea>
                    </div>
                    <hr>
                    <div class="col-xs-12">
                      <g:hiddenField id="commentAuthor" name="author" value="${sec.loggedInUserInfo(field: 'username')}" params="${[author: author]}"/>
                    </div>
                    <g:hiddenField name="title" value="${this.post.title}"/>
                    <g:submitButton id="makeComment" class="btn btn-primary col-xs-offset-8" value="submit" name="submit"/>
                  </g:formRemote>
                </div>
              </fieldset>
            </div>
        </div>

        <script>
          $("#makeComment").bind("click", function() {
            var comment = $('#commentCreate').val();
            var commentAuthor = $('#commentAuthor').val();
            var dateCreated = new Date();
            $(".commentDisplay").after(commentAppend(comment, commentAuthor, dateCreated.toDateString()));
          });

          function commentAppend(comment, author, date) {
            return "<div><span><h5><strong>" + author + "</strong></h5></span></div>"
             + "<div>" + comment + "</div>"
             + "<span class=\"pull-right\"><h5>Posting date:" + date + "</h5></span><br><hr>";
          }
        </script>
    </body>

</html>
