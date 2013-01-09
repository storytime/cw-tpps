
<%@ page import="cw.Trip" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'trip.label', default: 'Trip')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-trip" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-trip" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list trip">
			
				<g:if test="${tripInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="trip.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${tripInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tripInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="trip.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${tripInstance}" field="rating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tripInstance?.decription}">
				<li class="fieldcontain">
					<span id="decription-label" class="property-label"><g:message code="trip.decription.label" default="Decription" /></span>
					
						<span class="property-value" aria-labelledby="decription-label"><g:fieldValue bean="${tripInstance}" field="decription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tripInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="trip.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${tripInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tripInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="trip.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${tripInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tripInstance?.fk_countries}">
				<li class="fieldcontain">
					<span id="countries-label" class="property-label"><g:message code="trip.countries.label" default="Countries" /></span>
					
						<g:each in="${tripInstance.fk_countries}" var="c">
						<span class="property-value" aria-labelledby="countries-label"><g:link controller="country" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tripInstance?.fk_vacationPackage}">
				<li class="fieldcontain">
					<span id="fk_vacationPackage-label" class="property-label"><g:message code="trip.fk_vacationPackage.label" default="Vacation Package" /></span>
					
						<span class="property-value" aria-labelledby="fk_vacationPackage-label"><g:link controller="vacationPackage" action="show" id="${tripInstance?.fk_vacationPackage?.id}">${tripInstance?.fk_vacationPackage?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tripInstance?.id}" />
					<g:link class="edit" action="edit" id="${tripInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
