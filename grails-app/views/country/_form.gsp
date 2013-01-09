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

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'trips', 'error')} ">
	<label for="trips">
		<g:message code="country.trips.label" default="Trips" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${countryInstance?.trips?}" var="t">
    <li><g:link controller="trip" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="trip" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trip.label', default: 'Trip')])}</g:link>
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