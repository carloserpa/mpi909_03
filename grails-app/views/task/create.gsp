<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-task" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.task}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.task}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                     <!--<f:all bean="task"/> -->
                     <f:with bean="task">
                        <f:field property="task"/>
                        <f:field property="requiredBy"/>
                       <f:field property="category">                            
                            <g:select name="category" from="${br.com.taskapp.Categoria.list()}" 
                             optionKey="id" optionValue='descricao' noSelection="${['null':'Select One...']}" 
                            value="${task.category}"/>                            
                        </f:field>
                    </f:with>                    
                </fieldset>

                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <input type='reset' value='Reset' />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
