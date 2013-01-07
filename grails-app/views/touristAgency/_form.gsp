<%@ page import="cw.TouristAgency" %>



<div class="fieldcontain ${hasErrors(bean: touristAgencyInstance, field: 'regDate', 'error')} required">
	<label for="regDate">
		<g:message code="touristAgency.regDate.label" default="Reg Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="regDate" precision="day"  value="${touristAgencyInstance?.regDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: touristAgencyInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="touristAgency.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="owner" cols="40" rows="5" maxlength="255" required="" value="${touristAgencyInstance?.owner}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: touristAgencyInstance, field: 'decription', 'error')} required">
	<label for="decription">
		<g:message code="touristAgency.decription.label" default="Decription" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="decription" cols="40" rows="5" maxlength="10000" required="" value="${touristAgencyInstance?.decription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: touristAgencyInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="touristAgency.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" maxlength="12" required="" value="${touristAgencyInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: touristAgencyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="touristAgency.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="25" required="" value="${touristAgencyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: touristAgencyInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="touristAgency.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" maxlength="25" required="" value="${touristAgencyInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: touristAgencyInstance, field: 'passwdHash', 'error')} required">
	<label for="passwdHash">
		<g:message code="touristAgency.passwdHash.label" default="Passwd Hash" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="passwdHash" maxlength="25" required="" value="${touristAgencyInstance?.passwdHash}"/>
</div>
<g:if test="${session.admin!=null}" >

<div class="fieldcontain ${hasErrors(bean: touristAgencyInstance, field: 'vacationPackages', 'error')} ">
	<label for="vacationPackages">
		<g:message code="touristAgency.vacationPackages.label" default="Vacation Packages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${touristAgencyInstance?.vacationPackages?}" var="v">
    <li><g:link controller="vacationPackage" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vacationPackage" action="create" params="['touristAgency.id': touristAgencyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vacationPackage.label', default: 'VacationPackage')])}</g:link>
</li>
</ul>

</div>

</g:if>