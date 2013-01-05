
<%@ page import="cw.Country" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-country" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="wikiLink" title="${message(code: 'country.wikiLink.label', default: 'Wiki Link')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'country.name.label', default: 'Name')}" />
					
						<th><g:message code="country.fk_trip.label" default="Fktrip" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${countryInstanceList}" status="i" var="countryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${countryInstance.id}">${fieldValue(bean: countryInstance, field: "wikiLink")}</g:link></td>
					
						<td>${fieldValue(bean: countryInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: countryInstance, field: "fk_trip")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${countryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
