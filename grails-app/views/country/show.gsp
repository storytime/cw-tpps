
<%@ page import="cw.Country" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-country" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list country">
			
				<g:if test="${countryInstance?.wikiLink}">
				<li class="fieldcontain">
					<span id="wikiLink-label" class="property-label"><g:message code="country.wikiLink.label" default="Wiki Link" /></span>
					
						<span class="property-value" aria-labelledby="wikiLink-label"><g:fieldValue bean="${countryInstance}" field="wikiLink"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="country.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${countryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.fk_trip}">
				<li class="fieldcontain">
					<span id="fk_trip-label" class="property-label"><g:message code="country.fk_trip.label" default="Fktrip" /></span>
					
						<span class="property-value" aria-labelledby="fk_trip-label"><g:link controller="trip" action="show" id="${countryInstance?.fk_trip?.id}">${countryInstance?.fk_trip?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.hotels}">
				<li class="fieldcontain">
					<span id="hotels-label" class="property-label"><g:message code="country.hotels.label" default="Hotels" /></span>
					
						<g:each in="${countryInstance.hotels}" var="h">
						<span class="property-value" aria-labelledby="hotels-label"><g:link controller="hotel" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.places}">
				<li class="fieldcontain">
					<span id="places-label" class="property-label"><g:message code="country.places.label" default="Places" /></span>
					
						<g:each in="${countryInstance.places}" var="p">
						<span class="property-value" aria-labelledby="places-label"><g:link controller="place" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${countryInstance?.id}" />
					<g:link class="edit" action="edit" id="${countryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
