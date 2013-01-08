<%@ page import="cw.Trip" %>



<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="trip.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="price" from="${0..10000}" class="range" required="" value="${fieldValue(bean: tripInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="trip.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="rating" from="${0..5}" class="range" required="" value="${fieldValue(bean: tripInstance, field: 'rating')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'decription', 'error')} required">
	<label for="decription">
		<g:message code="trip.decription.label" default="Decription" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="decription" cols="40" rows="5" maxlength="10000" required="" value="${tripInstance?.decription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="trip.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${tripInstance?.type}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="trip.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${tripInstance?.name}"/>
</div>
<g:if test="${session.admin}">
<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'countries', 'error')} ">
	<label for="countries">
		<g:message code="trip.countries.label" default="Countries" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tripInstance?.countries?}" var="c">
    <li><g:link controller="country" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="country" action="create" params="['trip.id': tripInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'country.label', default: 'Country')])}</g:link>
</li>
</ul>

</div>
</g:if>
<div class="fieldcontain ${hasErrors(bean: tripInstance, field: 'fk_vacationPackage', 'error')} required">
	<label for="fk_vacationPackage">
		<g:message code="trip.fk_vacationPackage.label" default="Fkvacation Package" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fk_vacationPackage" name="fk_vacationPackage.id" from="${session.touristAgency.mapWizard.get("vacationPackage")}" optionKey="id" required="" value="${tripInstance?.fk_vacationPackage?.id}" class="many-to-one"/>
</div>

