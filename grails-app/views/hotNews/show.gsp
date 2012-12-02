
<%@ page import="cw.HotNews" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hotNews.label', default: 'HotNews')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hotNews" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hotNews" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hotNews">
			
				<g:if test="${hotNewsInstance?.decription}">
				<li class="fieldcontain">
					<span id="decription-label" class="property-label"><g:message code="hotNews.decription.label" default="Decription" /></span>
					
						<span class="property-value" aria-labelledby="decription-label"><g:fieldValue bean="${hotNewsInstance}" field="decription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotNewsInstance?.fk_places}">
				<li class="fieldcontain">
					<span id="fk_places-label" class="property-label"><g:message code="hotNews.fk_places.label" default="Fkplaces" /></span>
					
						<span class="property-value" aria-labelledby="fk_places-label"><g:link controller="place" action="show" id="${hotNewsInstance?.fk_places?.id}">${hotNewsInstance?.fk_places?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hotNewsInstance?.vacationPackages}">
				<li class="fieldcontain">
					<span id="vacationPackages-label" class="property-label"><g:message code="hotNews.vacationPackages.label" default="Vacation Packages" /></span>
					
						<g:each in="${hotNewsInstance.vacationPackages}" var="v">
						<span class="property-value" aria-labelledby="vacationPackages-label"><g:link controller="vacationPackage" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${hotNewsInstance?.id}" />
					<g:link class="edit" action="edit" id="${hotNewsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
