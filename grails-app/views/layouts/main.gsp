<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Tourist Portal"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!--<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">-->
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'styles.css')}" type="text/css">
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lobster" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="tourLogo" role="banner" align="center" style="background-color: #002940"><img src="${resource(dir: 'images', file: 'header.png')}" alt="Tour"/></div>
						<div align="left" style="background-color: #f0f0f0">
            <ul class="fancyNav">
            	 <li><a class="home" href="${createLink(uri: '/')}">Main</a></li>
                <li id="Action" class="controller"><g:link controller="action">Action</g:link></li>
                <li id="Country" class="controller"><g:link controller="country">Country</g:link></li>
                <li id="Place" class="controller"><g:link controller="place">Place</g:link></li>         
                <li id="TouristAgency" class="controller"><g:link controller="touristAgency">TouristAgency</g:link></li>
                <li id="Administration" class="controller"><g:link controller="admin">Administration</g:link></li>
                <li id="Map" class="controller"><a href="#">Map</a></li>            
            </ul>
			</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />

	</body>
</html>
