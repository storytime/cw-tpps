
<%@ page import="cw.Charter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'charter.label', default: 'Charter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-charter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-charter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list charter">
			
				<g:if test="${charterInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="charter.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${charterInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${charterInstance?.typeCharter}">
				<li class="fieldcontain">
					<span id="typeCharter-label" class="property-label"><g:message code="charter.typeCharter.label" default="Type Charter" /></span>
					
						<span class="property-value" aria-labelledby="typeCharter-label"><g:fieldValue bean="${charterInstance}" field="typeCharter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${charterInstance?.classCharter}">
				<li class="fieldcontain">
					<span id="classCharter-label" class="property-label"><g:message code="charter.classCharter.label" default="Class Charter" /></span>
					
						<span class="property-value" aria-labelledby="classCharter-label"><g:fieldValue bean="${charterInstance}" field="classCharter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${charterInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="charter.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${charterInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${charterInstance?.vacationPackages}">
				<li class="fieldcontain">
					<span id="vacationPackages-label" class="property-label"><g:message code="charter.vacationPackages.label" default="Vacation Packages" /></span>
					
						<g:each in="${charterInstance.vacationPackages}" var="v">
						<span class="property-value" aria-labelledby="vacationPackages-label"><g:link controller="vacationPackage" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${charterInstance?.id}" />
					<g:link class="edit" action="edit" id="${charterInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
