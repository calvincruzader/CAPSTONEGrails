<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
      <a href="#create-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
      <div class="nav" role="navigation">
        <ul>
          <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
          <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        </ul>
      </div>
      <div id="create-post" class="content scaffold-create" role="main">
        <h1><g:message code="default.create.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.post}">
        <ul class="errors" role="alert">
          <g:eachError bean="${this.post}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
          </g:eachError>
        </ul>
          </g:hasErrors>
          <g:form action="save">
              <fieldset class="form col-xs-12">
                <div>
                  <label>Title:</label>
             		   <input class="form-control" name="title" type="text">
             	   </div>
             	   <div>
             	     <label>Body:</label>
                   <textarea class="form-control" name="body" type="text" rows="3"></textarea>
                 </div>
					       <div>
                   ${new Date()}
						      <g:hiddenField name="author" value="${sec.loggedInUserInfo(field: 'username')}"/>
                  <g:hiddenField name="dateCreated" value="'${new Date()}'"/>
					      </div>
              </fieldset>
              <br>
              <fieldset class="buttons btn-toolbar">
              <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
              </fieldset>
            </g:form>
        </div>
    </body>
</html>
