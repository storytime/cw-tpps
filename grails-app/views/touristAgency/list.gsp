
<%@ page import="cw.TouristAgency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'touristAgency.label', default: 'TouristAgency')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-touristAgency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-touristAgency" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="regDate" title="${message(code: 'touristAgency.regDate.label', default: 'Reg Date')}" />
					
						<g:sortableColumn property="owner" title="${message(code: 'touristAgency.owner.label', default: 'Owner')}" />
					
						<g:sortableColumn property="decription" title="${message(code: 'touristAgency.decription.label', default: 'Decription')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'touristAgency.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'touristAgency.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="login" title="${message(code: 'touristAgency.login.label', default: 'Login')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${touristAgencyInstanceList}" status="i" var="touristAgencyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${touristAgencyInstance.id}">${fieldValue(bean: touristAgencyInstance, field: "regDate")}</g:link></td>
					
						<td>${fieldValue(bean: touristAgencyInstance, field: "owner")}</td>
					
						<td>${fieldValue(bean: touristAgencyInstance, field: "decription")}</td>
					
						<td>${fieldValue(bean: touristAgencyInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: touristAgencyInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: touristAgencyInstance, field: "login")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${touristAgencyInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
