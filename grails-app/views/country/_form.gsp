<%@ page import="cw.Country" %>



<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'wikiLink', 'error')} required">
	<label for="wikiLink">
		<g:message code="country.wikiLink.label" default="Wiki Link" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="wikiLink" cols="40" rows="5" maxlength="255" required="" value="${countryInstance?.wikiLink}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="country.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select from="${countryList}" name="name" value="${countryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'fk_trip', 'error')} required">
	<label for="fk_trip">
		<g:message code="country.fk_trip.label" default="Fktrip" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fk_trip" name="fk_trip.id" from="${session.touristAgency.mapWizard.get("trip")}" optionKey="id" required="" value="${countryInstance?.fk_trip?.id}" class="many-to-one"/>
</div>

<g:if test="${session.admin}">
<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'hotels', 'error')} ">
	<label for="hotels">
		<g:message code="country.hotels.label" default="Hotels" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${countryInstance?.hotels?}" var="h">
    <li><g:link controller="hotel" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="hotel" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'hotel.label', default: 'Hotel')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'places', 'error')} ">
	<label for="places">
		<g:message code="country.places.label" default="Places" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${countryInstance?.places?}" var="p">
    <li><g:link controller="place" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="place" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'place.label', default: 'Place')])}</g:link>
</li>
</ul>

</div>

</g:if>