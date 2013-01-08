<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Administration</title>
	</head>
	<body>
	<g:if test="${session.admin==null}">
		<div align="center"><b style="color: red" >You not administrator</b></div>
		<div align="center">(If you want contact us, our phone number: <img align="top" src="${resource(dir:'images', file: 'life.gif')}" width="35" height="20"/>0636557965)</div>
		<div align="center" style="padding-top: 2px"><g:img dir="images" file="administration.jpg"/></div>
	</g:if>
	<g:else>
	<h3 align="center">Welcome ${session.admin.name}</h3>
	<table>
	<h3>Data administration staff</h3>
	<tr>
	<td>
	<g:link controller="Admin" action="list"><img style="padding-right: 10px" align="top" title="Admin" src="${resource(dir:'images', file: 'admin.jpg')}" width="150" height="150"/></g:link>
	<g:link controller="User" action="list"><img style="padding-right: 10px" align="top" title="User" src="${resource(dir:'images', file: 'user.png')}" width="150" height="150"/></g:link>
	<g:link controller="TouristAgency" action="list"><img style="padding-right: 10px" align="top" title="TouristAgency" src="${resource(dir:'images', file: 'travelAgency.jpg')}" width="150" height="150"/></g:link>
	</td>
	</tr>
	<tr>
	<td>
	<h3>Administration of the data subject domain</h3>
	<g:link controller="Action" action="list"><img align="top" title="Action" src="${resource(dir:'images', file: 'action.png')}" width="150" height="150"/></g:link>
	<g:link controller="Charter" action="list"><img align="top" title="Charter" src="${resource(dir:'images', file: 'charter.jpg')}" width="100" height="150"/></g:link>
	<g:link controller="Country" action="list"><img align="top" title="Country" src="${resource(dir:'images', file: 'country.png')}" width="150" height="100"/></g:link>
	<g:link controller="place" action="list"><img align="top" title="Place" src="${resource(dir:'images', file: 'place.jpg')}" width="150" height="120"/></g:link>
	<g:link controller="Hotel" action="index"><img align="top" title="Hotel" src="${resource(dir:'images', file: 'hotel.jpg')}" width="150" height="120"/></g:link>
	<g:link controller="hotNews" action="index"><img align="top" title="HotNews.jpg" src="${resource(dir:'images', file: 'hotNews.jpg')}" width="150" height="120"/></g:link>
	</td>
	</tr>
		<tr>
	<td>
	<h3>Trip and Vacation package</h3>
	<g:link controller="trip" action="list"><img align="top" title="Trip" src="${resource(dir:'images', file: 'trip.jpg')}" width="150" height="100"/></g:link>
	<g:link controller="vacationPackage" action="list"><img align="top" title="VacationPackage" src="${resource(dir:'images', file: 'vacationPackage.jpg')}" width="150" height="100"/></g:link>
	</td>
	</tr>
	</table>
	
	</g:else>
	</body>
</html>
