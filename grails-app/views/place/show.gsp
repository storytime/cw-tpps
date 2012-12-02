
<%@ page import="cw.Place" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'place.label', default: 'Place')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-place" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-place" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list place">
			
				<g:if test="${placeInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="place.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${placeInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${placeInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="place.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:fieldValue bean="${placeInstance}" field="time"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${placeInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="place.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${placeInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${placeInstance?.decription}">
				<li class="fieldcontain">
					<span id="decription-label" class="property-label"><g:message code="place.decription.label" default="Decription" /></span>
					
						<span class="property-value" aria-labelledby="decription-label"><g:fieldValue bean="${placeInstance}" field="decription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${placeInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="place.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:fieldValue bean="${placeInstance}" field="image"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${placeInstance?.fk_countris}">
				<li class="fieldcontain">
					<span id="fk_countris-label" class="property-label"><g:message code="place.fk_countris.label" default="Fkcountris" /></span>
					
						<span class="property-value" aria-labelledby="fk_countris-label"><g:link controller="country" action="show" id="${placeInstance?.fk_countris?.id}">${placeInstance?.fk_countris?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${placeInstance?.hotNews}">
				<li class="fieldcontain">
					<span id="hotNews-label" class="property-label"><g:message code="place.hotNews.label" default="Hot News" /></span>
					
						<g:each in="${placeInstance.hotNews}" var="h">
						<span class="property-value" aria-labelledby="hotNews-label"><g:link controller="hotNews" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${placeInstance?.id}" />
					<g:link class="edit" action="edit" id="${placeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
