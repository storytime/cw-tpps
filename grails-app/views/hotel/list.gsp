
<%@ page import="cw.Hotel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hotel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hotel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'hotel.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="pricePerDay" title="${message(code: 'hotel.pricePerDay.label', default: 'Price Per Day')}" />
					
						<g:sortableColumn property="rest" title="${message(code: 'hotel.rest.label', default: 'Rest')}" />
					
						<th><g:message code="hotel.fk_countries.label" default="Fkcountries" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hotelInstanceList}" status="i" var="hotelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hotelInstance.id}">${fieldValue(bean: hotelInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: hotelInstance, field: "pricePerDay")}</td>
					
						<td>${fieldValue(bean: hotelInstance, field: "rest")}</td>
					
						<td>${fieldValue(bean: hotelInstance, field: "fk_countries")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hotelInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
