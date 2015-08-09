<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="list" action="index" controller="categoria">Manager Categories</g:link></li>
            </ul>
        </div>
        <div id="list-task" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:table collection="${taskList}" /> -->
                <table id="tblTasks">
                <colgroup>
                    <col width="30%">
                    <col width="15%">
                    <col width="15%">
                    <col width="40%">
                </colgroup>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Deadline</th>
                        <th>Categoria</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${taskList}" var="task">                                    
                    <tr class=" ${(task.complete == 1 ? 'taskCompleted' : 'null')} 
                                ${(task.requiredBy < new Date() - 1 ? 'overdue' : 'null')}                                
                                ${((((task.requiredBy.time - (new Date()-1).time) / (24 * 60 * 60 * 1000)) <= 5) && 
                                   (((task.requiredBy.time - (new Date()-1).time) / (24 * 60 * 60 * 1000)) >= 0) ? 'warning': 'null')}">                      
                        <td>${task.task} </td>                        
                        <td><g:formatDate format="dd-MM-yyyy" date="${task.requiredBy}"/></td>                        
                        <td>${task.category}</td>                        
                        <td>                            
                            <g:form resource="${task}" method="DELETE">
                            <fieldset class="buttons" style="background-color: transparent!important; -webkit-box-shadow: none!important;">
                                <g:if test="${task.complete == 0}">
                                <g:link class="complete"  action="complete" resource="${task}">
                                <g:message code="default.button.complete.label" default="Completar" />
                                </g:link>
                                <g:link class="edit" action="edit" resource="${task}" disabled="disabled">
                                <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                </g:if>
                                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                            </fieldset>
                        </g:form>
                        </td>
                     </tr>
                     </g:each>                      
                    
                </tbody>
            </table>
            <center> <strong>${taskCount - tasksCompleteCount} Tarefas</strong></center></div> </br>
            <div class="pagination">                                                        
                <g:paginate total="${taskCount ?: 0}" />
            </div>
        </div>
    </body>
</html>