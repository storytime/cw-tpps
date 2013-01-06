<%@ page import="cw.TouristAgency" %>
<!DOCTYPE html>
<html>
	<head>
	<head>
	<body>
		<h2 align="center">	Add wizard vacation package </h2>
	<table><tr>
		<th>
		<g:remoteLink controller ="action" action="createWizardAction" update="stepByStepAddVacationPackage">Create or choose Action</g:remoteLink>
		</th>
		</tr>
		</table>		
		<div id="stepByStepAddVacationPackage"></div>
	</body>