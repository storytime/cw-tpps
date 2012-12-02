<%@ page import="cw.Hotel" %>



<div class="fieldcontain ${hasErrors(bean: hotelInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="hotel.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="255" required="" value="${hotelInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hotelInstance, field: 'pricePerDay', 'error')} required">
	<label for="pricePerDay">
		<g:message code="hotel.pricePerDay.label" default="Price Per Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="pricePerDay" from="${0..10000}" class="range" required="" value="${fieldValue(bean: hotelInstance, field: 'pricePerDay')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hotelInstance, field: 'rest', 'error')} ">
	<label for="rest">
		<g:message code="hotel.rest.label" default="Rest" />
		
	</label>
	<g:textArea name="rest" cols="40" rows="5" maxlength="255" value="${hotelInstance?.rest}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hotelInstance, field: 'fk_countries', 'error')} required">
	<label for="fk_countries">
		<g:message code="hotel.fk_countries.label" default="Fkcountries" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fk_countries" name="fk_countries.id" from="${cw.Country.list()}" optionKey="id" required="" value="${hotelInstance?.fk_countries?.id}" class="many-to-one"/>
</div>

