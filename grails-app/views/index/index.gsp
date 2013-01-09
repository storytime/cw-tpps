<%@ page import="cw.Place" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Tourist portal</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			} 
		</style>
	</head>
	<body>

	<table>
    <tr> 
    	<g:if test="${login}">
    <td valign="top" style="padding-left: 1em;">
	<g:form url="[action:'doLogin',controller:'user']" method="post">
		<p>Enter your login details below:</p>
		<table>
		<tr>
		<td valign='top' style='text-align:left;'>
		<label for='name'>Login:</label>
		</td>
		<td valign='top' style='text-align:left;'>
		<input id="name" type='text' name='name' value='${user?.name}' />
		</td>
		</tr>
		<tr>
		<td valign='top' style='text-align:left;'>
		<label for='password'>Password:</label>
		</td>
		<td valign='top' style='text-align:left;' >
		<input id="password" type='password' name='password'
		value='${user?.passwdHash}' />
		</td>
		</tr>
		</table>
		<div class="buttons">		
		<input type="submit" value="Login"></input>			
		<a href="user/registration" style="color: #666666">Registration</a>
		</div>
		</g:form>
		<g:if test="${flash.message}">
			     <p style="color: red;">${flash.message}<p>
		</g:if>
		</td>
		</g:if>
		<g:else>
		<td style="width: 100px">
		<div class="buttons">
		<g:link action="Logout">Log out</g:link>
		</div>
		</td>
		</g:else>
		<td align="center" style="padding-left: 1em;">
			<h1>Welcome to TouristPortal</h1>
			<h3><p>In this site you can buy vacation package</p></h3>
			    <table>
					
				<g:each in="${placeInstanceList}" status="i" var="placeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					<td><img align="left" style="padding-right: 10px" src="${resource(dir:'placeImages', file: placeInstance.image)}" width="300" height="150" />
					
						${fieldValue(bean: placeInstance, field: "decription")}</td>
					
											
			</g:each>
				</tbody>
			</table>
		
			</td>
			</tr>
			</table>
	</body>
</html>
