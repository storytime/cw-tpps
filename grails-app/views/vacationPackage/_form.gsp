<%@ page import="cw.VacationPackage" %>



<div class="fieldcontain ${hasErrors(bean: vacationPackageInstance, field: 'priceFull', 'error')} required">
	<label for="priceFull">
		<g:message code="vacationPackage.priceFull.label" default="Price Full" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="priceFull" from="${0..10000}" class="range" required="" value="${fieldValue(bean: vacationPackageInstance, field: 'priceFull')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationPackageInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="vacationPackage.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${vacationPackageInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vacationPackageInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="vacationPackage.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${vacationPackageInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vacationPackageInstance, field: 'people', 'error')} required">
	<label for="people">
		<g:message code="vacationPackage.people.label" default="People" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="people" from="${0..10}" class="range" required="" value="${fieldValue(bean: vacationPackageInstance, field: 'people')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationPackageInstance, field: 'fk_action', 'error')} required">
	<label for="fk_action">
		<g:message code="vacationPackage.fk_action.label" default="Fkaction" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fk_action" name="fk_action.id" from="${cw.Action.list()}" optionKey="id" required="" value="${vacationPackageInstance?.fk_action?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationPackageInstance, field: 'fk_charter', 'error')} required">
	<label for="fk_charter">
		<g:message code="vacationPackage.fk_charter.label" default="Fkcharter" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fk_charter" name="fk_charter.id" from="${cw.Charter.list()}" optionKey="id" required="" value="${vacationPackageInstance?.fk_charter?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationPackageInstance, field: 'fk_touristAgency', 'error')} required">
	<label for="fk_touristAgency">
		<g:message code="vacationPackage.fk_touristAgency.label" default="Fktourist Agency" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fk_touristAgency" name="fk_touristAgency.id" from="${cw.TouristAgency.list()}" optionKey="id" required="" value="${vacationPackageInstance?.fk_touristAgency?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacationPackageInstance, field: 'trip', 'error')} ">
	<label for="trip">
		<g:message code="vacationPackage.trip.label" default="Trip" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vacationPackageInstance?.trip?}" var="t">
    <li><g:link controller="trip" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="trip" action="create" params="['vacationPackage.id': vacationPackageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'trip.label', default: 'Trip')])}</g:link>
</li>
</ul>

</div>

