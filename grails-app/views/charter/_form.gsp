<%@ page import="cw.Charter" %>




<div class="fieldcontain ${hasErrors(bean: charterInstance, field: 'idNumber', 'error')} required">
	<label for="idNumber">
		<g:message code="charter.idNumber.label" default="Id Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idNumber" value="${charterInstance?.idNumber}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: charterInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="charter.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${charterInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: charterInstance, field: 'typeCharter', 'error')} ">
	<label for="typeCharter">
		<g:message code="charter.typeCharter.label" default="Type Charter" />
		
	</label>
	<g:select name="typeCharter" from="${charterInstance.constraints.typeCharter.inList}" value="${charterInstance?.typeCharter}" valueMessagePrefix="charter.typeCharter" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: charterInstance, field: 'classCharter', 'error')} ">
	<label for="classCharter">
		<g:message code="charter.classCharter.label" default="Class Charter" />
		
	</label>
	<g:select name="classCharter" from="${charterInstance.constraints.classCharter.inList}" value="${charterInstance?.classCharter}" valueMessagePrefix="charter.classCharter" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: charterInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="charter.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="price" from="${1..10000}" class="range" required="" value="${fieldValue(bean: charterInstance, field: 'price')}"/>
</div>
<g:if test="${session.admin}">
<div class="fieldcontain ${hasErrors(bean: charterInstance, field: 'vacationPackages', 'error')} ">
	<label for="vacationPackages">
		<g:message code="charter.vacationPackages.label" default="Vacation Packages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${charterInstance?.vacationPackages?}" var="v">
    <li><g:link controller="vacationPackage" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vacationPackage" action="create" params="['charter.id': charterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vacationPackage.label', default: 'VacationPackage')])}</g:link>
</li>
</ul>

</div>
</g:if>
