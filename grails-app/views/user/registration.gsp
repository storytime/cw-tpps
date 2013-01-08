
<%@ page import="cw.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">		
		<title>Registration</title>
	</head>
	<body>
	<h2 align="center">Registration</h2>
	Do you want to register as a <g:remoteLink action="registration_user" update="registration">user</g:remoteLink> or as a <g:remoteLink controller='touristAgency' action='registration_touristAgency' update="registration">travel agency</g:remoteLink>
	<div id="registration"></div>
	</body>
</html>
