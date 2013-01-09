
<%@ page import="cw.Charter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'charter.label', default: 'Charter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<h2 align="center">	Add wizard vacation package </h2>
	<h3>Create or choose charter</h3>
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
					</tr>
				</thead>
				<tbody>
				<g:each in="${charterInstanceList}" status="i" var="charterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: charterInstance, field: "startDate")}</td>
					
						<td>${fieldValue(bean: charterInstance, field: "typeCharter")}</td>
						<td><g:link action="choose" id="${charterInstance.id}">choose</g:link></td>					
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
