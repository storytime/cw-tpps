
<%@ page import="cw.VacationPackage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vacationPackage.label', default: 'VacationPackage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vacationPackage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vacationPackage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="priceFull" title="${message(code: 'vacationPackage.priceFull.label', default: 'Price Full')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'vacationPackage.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'vacationPackage.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="people" title="${message(code: 'vacationPackage.people.label', default: 'People')}" />
					
						<th><g:message code="vacationPackage.fk_action.label" default="Fkaction" /></th>
					
						<th><g:message code="vacationPackage.fk_charter.label" default="Fkcharter" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vacationPackageInstanceList}" status="i" var="vacationPackageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vacationPackageInstance.id}">${fieldValue(bean: vacationPackageInstance, field: "priceFull")}</g:link></td>
					
						<td><g:formatDate date="${vacationPackageInstance.startDate}" /></td>
					
						<td><g:formatDate date="${vacationPackageInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: vacationPackageInstance, field: "people")}</td>
					
						<td>${fieldValue(bean: vacationPackageInstance, field: "fk_action")}</td>
					
						<td>${fieldValue(bean: vacationPackageInstance, field: "fk_charter")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vacationPackageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
