<%@ page import="cw.TouristAgency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'touristAgency.label', default: 'Travel agency')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:if test="${session.touristAgency}">
	<h2 style="color:silver;">Welcome "${session.touristAgency.name}"</h2>
	<p>If you want to vacation package please follow the following instructions <g:remoteLink action="addWizard" update="addWizard">add wizard vacation package.</g:remoteLink></p>
	<div id="addWizard" style="padding-top: 20px"></div>
	</g:if> 
	<g:else> <h2 align="center">The list of the travel agency</h2>
	<table>
				<thead>
					<tr>														
						<g:sortableColumn property="name" title="${message(code: 'touristAgency.name.label', default: 'Name')}" />
						<g:sortableColumn property="owner" title="${message(code: 'touristAgency.owner.label', default: 'Owner')}" />
						<g:sortableColumn property="phone" title="${message(code: 'touristAgency.phone.label', default: 'Phone')}" />			
					</tr>	
				</thead>
				<tbody>
				<g:each in="${touristAgencyInstanceList}" status="i" var="touristAgencyInstance">
					<tr>											
						<td> <g:link action="show" id="${touristAgencyInstance.id}">${fieldValue(bean: touristAgencyInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: touristAgencyInstance, field: "owner")}</td>
						<td>${fieldValue(bean: touristAgencyInstance, field: "phone")}</td>								
					</tr>
				</g:each>
				</tbody>
			</table>
		</g:else>
	</body>
</html>
