
<%@ page import="cw.Trip" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trip.label', default: 'Trip')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-trip" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-trip" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="price" title="${message(code: 'trip.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="rating" title="${message(code: 'trip.rating.label', default: 'Rating')}" />
					
						<g:sortableColumn property="decription" title="${message(code: 'trip.decription.label', default: 'Decription')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'trip.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'trip.name.label', default: 'Name')}" />
					
						<th><g:message code="trip.fk_vacationPackage.label" default="Fkvacation Package" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tripInstanceList}" status="i" var="tripInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tripInstance.id}">${fieldValue(bean: tripInstance, field: "price")}</g:link></td>
					
						<td>${fieldValue(bean: tripInstance, field: "rating")}</td>
					
						<td>${fieldValue(bean: tripInstance, field: "decription")}</td>
					
						<td>${fieldValue(bean: tripInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: tripInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: tripInstance, field: "fk_vacationPackage")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tripInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
