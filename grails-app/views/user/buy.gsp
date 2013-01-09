
<%@ page import="cw.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Buy vacation package</title>
	</head>
	<body>
	<g:form action="sendMail">
		<label>Code Visa:</label><g:textField name="visa" value=""/>
		<g:hiddenField name="BuyVacationPackage" value="${vacationPackageBean.id}"/>
			<input  type="submit" value="Buy"/>
		</g:form>
	</body>
</html>
