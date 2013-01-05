
<%@ page import="cw.Charter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'charter.label', default: 'Charter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-charter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-charter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="startDate" title="${message(code: 'charter.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="typeCharter" title="${message(code: 'charter.typeCharter.label', default: 'Type Charter')}" />
					
						<g:sortableColumn property="classCharter" title="${message(code: 'charter.classCharter.label', default: 'Class Charter')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'charter.price.label', default: 'Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${charterInstanceList}" status="i" var="charterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${charterInstance.id}">${fieldValue(bean: charterInstance, field: "startDate")}</g:link></td>
					
						<td>${fieldValue(bean: charterInstance, field: "typeCharter")}</td>
					
						<td>${fieldValue(bean: charterInstance, field: "classCharter")}</td>
					
						<td>${fieldValue(bean: charterInstance, field: "price")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${charterInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
