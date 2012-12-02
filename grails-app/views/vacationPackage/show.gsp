
<%@ page import="cw.VacationPackage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vacationPackage.label', default: 'VacationPackage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vacationPackage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vacationPackage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vacationPackage">
			
				<g:if test="${vacationPackageInstance?.priceFull}">
				<li class="fieldcontain">
					<span id="priceFull-label" class="property-label"><g:message code="vacationPackage.priceFull.label" default="Price Full" /></span>
					
						<span class="property-value" aria-labelledby="priceFull-label"><g:fieldValue bean="${vacationPackageInstance}" field="priceFull"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacationPackageInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="vacationPackage.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${vacationPackageInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacationPackageInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="vacationPackage.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${vacationPackageInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacationPackageInstance?.people}">
				<li class="fieldcontain">
					<span id="people-label" class="property-label"><g:message code="vacationPackage.people.label" default="People" /></span>
					
						<span class="property-value" aria-labelledby="people-label"><g:fieldValue bean="${vacationPackageInstance}" field="people"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacationPackageInstance?.fk_action}">
				<li class="fieldcontain">
					<span id="fk_action-label" class="property-label"><g:message code="vacationPackage.fk_action.label" default="Fkaction" /></span>
					
						<span class="property-value" aria-labelledby="fk_action-label"><g:link controller="action" action="show" id="${vacationPackageInstance?.fk_action?.id}">${vacationPackageInstance?.fk_action?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacationPackageInstance?.fk_charter}">
				<li class="fieldcontain">
					<span id="fk_charter-label" class="property-label"><g:message code="vacationPackage.fk_charter.label" default="Fkcharter" /></span>
					
						<span class="property-value" aria-labelledby="fk_charter-label"><g:link controller="charter" action="show" id="${vacationPackageInstance?.fk_charter?.id}">${vacationPackageInstance?.fk_charter?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacationPackageInstance?.fk_touristAgency}">
				<li class="fieldcontain">
					<span id="fk_touristAgency-label" class="property-label"><g:message code="vacationPackage.fk_touristAgency.label" default="Fktourist Agency" /></span>
					
						<span class="property-value" aria-labelledby="fk_touristAgency-label"><g:link controller="touristAgency" action="show" id="${vacationPackageInstance?.fk_touristAgency?.id}">${vacationPackageInstance?.fk_touristAgency?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacationPackageInstance?.trip}">
				<li class="fieldcontain">
					<span id="trip-label" class="property-label"><g:message code="vacationPackage.trip.label" default="Trip" /></span>
					
						<g:each in="${vacationPackageInstance.trip}" var="t">
						<span class="property-value" aria-labelledby="trip-label"><g:link controller="trip" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vacationPackageInstance?.id}" />
					<g:link class="edit" action="edit" id="${vacationPackageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
