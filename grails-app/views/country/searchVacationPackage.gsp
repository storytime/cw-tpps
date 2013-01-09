<%@ page import="cw.Country" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Search vacation package</title>
	</head>
	<body>
		<table>
		<h2 align="center" style="padding: 10px"> Result searching </h2>
				<thead>
					<tr>				
						<th>Full price</th>
						<th>Start date</th>
						<th>End Date</th>
						<th>People</th>
						<th><g:message code="vacationPackage.fk_action.label" default="Action" /></th>
					
						<th><g:message code="vacationPackage.fk_charter.label" default="Charter" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vacationPackageList}" status="i" var="vacationPackageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: vacationPackageInstance, field: "priceFull")}</td>
					
						<td><g:formatDate date="${vacationPackageInstance.startDate}" /></td>
					
						<td><g:formatDate date="${vacationPackageInstance.endDate}" /></td>
					
						<td>${fieldValue(bean: vacationPackageInstance, field: "people")}</td>
					
						<td>${fieldValue(bean: vacationPackageInstance, field: "fk_action")}</td>
					
						<td>${fieldValue(bean: vacationPackageInstance, field: "fk_charter")}</td>
						<g:if test="${session.user!=null}">
						<td><g:link controller="user" id="${vacationPackageInstance.id}" action="buy">Buy</g:link></td>
						</g:if>
					</tr>
				</g:each>
				</tbody>
			</table>
	</body>
</html>
