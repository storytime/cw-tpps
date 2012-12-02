<%@ page import="cw.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'secondName', 'error')} required">
	<label for="secondName">
		<g:message code="user.secondName.label" default="Second Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="secondName" maxlength="25" required="" value="${userInstance?.secondName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="user.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" maxlength="12" required="" value="${userInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwdHash', 'error')} required">
	<label for="passwdHash">
		<g:message code="user.passwdHash.label" default="Passwd Hash" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="passwdHash" cols="40" rows="5" maxlength="255" required="" value="${userInstance?.passwdHash}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="user.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="address" cols="40" rows="5" maxlength="255" required="" value="${userInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="25" required="" value="${userInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'balance', 'error')} required">
	<label for="balance">
		<g:message code="user.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="balance" from="${0..100000}" class="range" required="" value="${fieldValue(bean: userInstance, field: 'balance')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'avatar', 'error')} ">
	<label for="avatar">
		<g:message code="user.avatar.label" default="Avatar" />
		
	</label>
	<g:textField name="avatar" value="${userInstance?.avatar}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'vacationPackages', 'error')} ">
	<label for="vacationPackages">
		<g:message code="user.vacationPackages.label" default="Vacation Packages" />
		
	</label>
	<g:select name="vacationPackages" from="${cw.VacationPackage.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.vacationPackages*.id}" class="many-to-many"/>
</div>

