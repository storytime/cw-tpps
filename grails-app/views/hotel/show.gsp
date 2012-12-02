
<%@ page import="cw.Hotel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hotel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hotel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hotel">
			
				<g:if test="${hotelInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="hotel.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${hotelInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelInstance?.pricePerDay}">
				<li class="fieldcontain">
					<span id="pricePerDay-label" class="property-label"><g:message code="hotel.pricePerDay.label" default="Price Per Day" /></span>
					
						<span class="property-value" aria-labelledby="pricePerDay-label"><g:fieldValue bean="${hotelInstance}" field="pricePerDay"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelInstance?.rest}">
				<li class="fieldcontain">
					<span id="rest-label" class="property-label"><g:message code="hotel.rest.label" default="Rest" /></span>
					
						<span class="property-value" aria-labelledby="rest-label"><g:fieldValue bean="${hotelInstance}" field="rest"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotelInstance?.fk_countries}">
				<li class="fieldcontain">
					<span id="fk_countries-label" class="property-label"><g:message code="hotel.fk_countries.label" default="Fkcountries" /></span>
					
						<span class="property-value" aria-labelledby="fk_countries-label"><g:link controller="country" action="show" id="${hotelInstance?.fk_countries?.id}">${hotelInstance?.fk_countries?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${hotelInstance?.id}" />
					<g:link class="edit" action="edit" id="${hotelInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
