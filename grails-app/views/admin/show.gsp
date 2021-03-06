
<%@ page import="cw.Admin" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'admin.label', default: 'Admin')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-admin" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-admin" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list admin">
			
				<g:if test="${adminInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="admin.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${adminInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="admin.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${adminInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.secondName}">
				<li class="fieldcontain">
					<span id="secondName-label" class="property-label"><g:message code="admin.secondName.label" default="Second Name" /></span>
					
						<span class="property-value" aria-labelledby="secondName-label"><g:fieldValue bean="${adminInstance}" field="secondName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="admin.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${adminInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="admin.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${adminInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.passwdHash}">
				<li class="fieldcontain">
					<span id="passwdHash-label" class="property-label"><g:message code="admin.passwdHash.label" default="Passwd Hash" /></span>
					
						<span class="property-value" aria-labelledby="passwdHash-label"><g:fieldValue bean="${adminInstance}" field="passwdHash"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.avatar}">
				<li class="fieldcontain">
					<span id="avatar-label" class="property-label"><g:message code="admin.avatar.label" default="Avatar" /></span>
					
						<span class="property-value" aria-labelledby="avatar-label"><g:fieldValue bean="${adminInstance}" field="avatar"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adminInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="admin.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${adminInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${adminInstance?.id}" />
					<g:link class="edit" action="edit" id="${adminInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
