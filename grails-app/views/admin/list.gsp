
<%@ page import="cw.Admin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-admin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-admin" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'admin.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'admin.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="secondName" title="${message(code: 'admin.secondName.label', default: 'Second Name')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'admin.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="login" title="${message(code: 'admin.login.label', default: 'Login')}" />
					
						<g:sortableColumn property="passwdHash" title="${message(code: 'admin.passwdHash.label', default: 'Passwd Hash')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adminInstanceList}" status="i" var="adminInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${adminInstance.id}">${fieldValue(bean: adminInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: adminInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: adminInstance, field: "secondName")}</td>
					
						<td>${fieldValue(bean: adminInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: adminInstance, field: "login")}</td>
					
						<td>${fieldValue(bean: adminInstance, field: "passwdHash")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adminInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
