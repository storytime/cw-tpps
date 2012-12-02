
<%@ page import="cw.Action" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'action.label', default: 'Action')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-action" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-action" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list action">
			
				<g:if test="${actionInstance?.discount}">
				<li class="fieldcontain">
					<span id="discount-label" class="property-label"><g:message code="action.discount.label" default="Discount" /></span>
					
						<span class="property-value" aria-labelledby="discount-label"><g:fieldValue bean="${actionInstance}" field="discount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actionInstance?.decription}">
				<li class="fieldcontain">
					<span id="decription-label" class="property-label"><g:message code="action.decription.label" default="Decription" /></span>
					
						<span class="property-value" aria-labelledby="decription-label"><g:fieldValue bean="${actionInstance}" field="decription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actionInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="action.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${actionInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${actionInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="action.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${actionInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${actionInstance?.vacationPackages}">
				<li class="fieldcontain">
					<span id="vacationPackages-label" class="property-label"><g:message code="action.vacationPackages.label" default="Vacation Packages" /></span>
					
						<g:each in="${actionInstance.vacationPackages}" var="v">
						<span class="property-value" aria-labelledby="vacationPackages-label"><g:link controller="vacationPackage" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${actionInstance?.id}" />
					<g:link class="edit" action="edit" id="${actionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
