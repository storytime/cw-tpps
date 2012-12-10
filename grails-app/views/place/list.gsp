
<%@ page import="cw.Place" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'place.label', default: 'Place')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-place" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-place" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="price" title="${message(code: 'place.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="time" title="${message(code: 'place.time.label', default: 'Time')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'place.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="decription" title="${message(code: 'place.decription.label', default: 'Decription')}" />
					
						<g:sortableColumn property="image" title="${message(code: 'place.image.label', default: 'Image')}" />
					
						<th><g:message code="place.fk_countris.label" default="Fkcountris" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${placeInstanceList}" status="i" var="placeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${placeInstance.id}">${fieldValue(bean: placeInstance, field: "price")}</g:link></td>
					
						<td>${fieldValue(bean: placeInstance, field: "time")}</td>
					
						<td>${fieldValue(bean: placeInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: placeInstance, field: "decription")}</td>
					
						<td><img src="${resource(dir:'placeImages', file: placeInstance.image)}" /></td>
					
						<td>${fieldValue(bean: placeInstance, field: "fk_countris")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${placeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
