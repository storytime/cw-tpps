
<%@ page import="cw.Country" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:if test="${session.touristAgency!=null}">
	<h2 align="center">	Add wizard vacation package </h2>
	<h3>Create or choose country</h3>
	</g:if>
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
										
					</tr>
				</thead>
				<tbody>
				<g:each in="${countryInstanceList}" status="i" var="countryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<g:if test="${session.touristAgency==null}">
						<td><g:link action="show" id="${countryInstance.id}">${fieldValue(bean: countryInstance, field: "wikiLink")}</g:link></td>
						</g:if>
						<td>${fieldValue(bean: countryInstance, field: "wikiLink")}</td>
						<td>${fieldValue(bean: countryInstance, field: "name")}</td>
						<g:if test="${session.touristAgency!=null}">
						<td><g:link action="choose" id="${countryInstance.id}">choose</g:link></td>
						</g:if>
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
