
<%@ page import="cw.Action" %>
<%@ page import="cw.Charter" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'action.label', default: 'Action')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-action" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-action" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="Discount" title="${message(code: 'action.discount.label', default: 'Discount')}" />
					
						<g:sortableColumn property="Decription" title="${message(code: 'action.decription.label', default: 'Decription')}" />
					
						<g:sortableColumn property="EndDate" title="${message(code: 'action.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="StartDate" title="${message(code: 'action.startDate.label', default: 'Start Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${actionInstanceList}" status="i" var="actionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${actionInstance.id}">${fieldValue(bean: actionInstance, field: "discount")}</g:link></td>
					
						<td>${fieldValue(bean: actionInstance, field: "decription")}</td>
					
						<td><g:formatDate date="${actionInstance.endDate}" /></td>
					
						<td><g:formatDate date="${actionInstance.startDate}" /> </td>
						<td><g:link action="choose" id="${actionInstance.id}">choose</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${actionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
