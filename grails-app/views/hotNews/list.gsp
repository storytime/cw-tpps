
<%@ page import="cw.HotNews" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hotNews.label', default: 'HotNews')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hotNews" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hotNews" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="decription" title="${message(code: 'hotNews.decription.label', default: 'Decription')}" />
					
						<th><g:message code="hotNews.fk_places.label" default="Fkplaces" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hotNewsInstanceList}" status="i" var="hotNewsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hotNewsInstance.id}">${fieldValue(bean: hotNewsInstance, field: "decription")}</g:link></td>
					
						<td>${fieldValue(bean: hotNewsInstance, field: "fk_places")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hotNewsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
