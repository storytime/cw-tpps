
<%@ page import="cw.TouristAgency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'touristAgency.label', default: 'TouristAgency')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-touristAgency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${session.user==null}">
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		</g:if>
		<div id="show-touristAgency" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list touristAgency">
			
				<g:if test="${touristAgencyInstance?.regDate}">
				<li class="fieldcontain">
					<span id="regDate-label" class="property-label"><g:message code="touristAgency.regDate.label" default="Reg Date" /></span>
					
						<span class="property-value" aria-labelledby="regDate-label"><g:formatDate date="${touristAgencyInstance?.regDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${touristAgencyInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="touristAgency.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:fieldValue bean="${touristAgencyInstance}" field="owner"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${touristAgencyInstance?.decription}">
				<li class="fieldcontain">
					<span id="decription-label" class="property-label"><g:message code="touristAgency.decription.label" default="Decription" /></span>
					
						<span class="property-value" aria-labelledby="decription-label"><g:fieldValue bean="${touristAgencyInstance}" field="decription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${touristAgencyInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="touristAgency.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${touristAgencyInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			    <g:if test="${session.user==null}">
				<g:if test="${touristAgencyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="touristAgency.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${touristAgencyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${touristAgencyInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="touristAgency.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${touristAgencyInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${touristAgencyInstance?.passwdHash}">
				<li class="fieldcontain">
					<span id="passwdHash-label" class="property-label"><g:message code="touristAgency.passwdHash.label" default="Passwd Hash" /></span>
					
						<span class="property-value" aria-labelledby="passwdHash-label"><g:fieldValue bean="${touristAgencyInstance}" field="passwdHash"/></span>
					
				</li>
				</g:if>
				</g:if>
				<g:if test="${touristAgencyInstance?.vacationPackages}">
				<li class="fieldcontain">
					<span id="vacationPackages-label" class="property-label"><g:message code="touristAgency.vacationPackages.label" default="Vacation Packages" /></span>
					
						<g:each in="${touristAgencyInstance.vacationPackages}" var="v">
						<span class="property-value" aria-labelledby="vacationPackages-label"><g:link controller="vacationPackage" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:if test="${session.user==null}">
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${touristAgencyInstance?.id}" />
					<g:link class="edit" action="edit" id="${touristAgencyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</g:if>
		</div>
	</body>
</html>
