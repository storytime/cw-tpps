<%@ page import="cw.Action" %>



<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'discount', 'error')} required">
	<label for="discount">
		<g:message code="action.discount.label" default="Discount" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="discount" from="${0.1..99}" class="range" required="" value="${fieldValue(bean: actionInstance, field: 'discount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'decription', 'error')} required">
	<label for="decription">
		<g:message code="action.decription.label" default="Decription" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="decription" cols="40" rows="5" maxlength="10000" required="" value="${actionInstance?.decription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="action.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${actionInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="action.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${actionInstance?.startDate}"  />
</div>
<g:if test="${session.admin}">
<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'vacationPackages', 'error')} ">
	<label for="vacationPackages">
		<g:message code="action.vacationPackages.label" default="Vacation Packages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${actionInstance?.vacationPackages?}" var="v">
    <li><g:link controller="vacationPackage" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vacationPackage" action="create" params="['action.id': actionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vacationPackage.label', default: 'VacationPackage')])}</g:link>
</li>
</ul>

</div>
</g:if>
