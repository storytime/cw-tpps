<%@ page import="cw.HotNews" %>



<div class="fieldcontain ${hasErrors(bean: hotNewsInstance, field: 'decription', 'error')} required">
	<label for="decription">
		<g:message code="hotNews.decription.label" default="Decription" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="decription" cols="40" rows="5" maxlength="10000" required="" value="${hotNewsInstance?.decription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hotNewsInstance, field: 'fk_places', 'error')} required">
	<label for="fk_places">
		<g:message code="hotNews.fk_places.label" default="Fkplaces" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fk_places" name="fk_places.id" from="${cw.Place.list()}" optionKey="id" required="" value="${hotNewsInstance?.fk_places?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hotNewsInstance, field: 'vacationPackages', 'error')} ">
	<label for="vacationPackages">
		<g:message code="hotNews.vacationPackages.label" default="Vacation Packages" />
		
	</label>
	<g:select name="vacationPackages" from="${cw.VacationPackage.list()}" multiple="multiple" optionKey="id" size="5" value="${hotNewsInstance?.vacationPackages*.id}" class="many-to-many"/>
</div>

