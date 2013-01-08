<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:javascript src="googleMap.js" />
    </head>
	<body>
	<p style="margin: 10px"></p>
	<h2 align="center">Search vacation package in country</h2>
	<p style="margin: 10px"></p>
	<g:form url="[action:'searchVacationPackage',controller:'country']" method="post">
	<label style="margin-left: 10px"> Country: </label><input id="country"  type="text" name="country" value="${countryName}"/>
	<input type="submit" value="Search"></input>	
	</g:form>

	<p style="margin-bottom: 10px"></p>
	<div id="map_canvas" style="height:500px">    
    </div>
	</body>
	</html>