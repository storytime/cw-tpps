<%@ page import="cw.Admin" %>



<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="admin.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${adminInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="admin.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="25" required="" value="${adminInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'secondName', 'error')} required">
	<label for="secondName">
		<g:message code="admin.secondName.label" default="Second Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="secondName" maxlength="25" required="" value="${adminInstance?.secondName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="admin.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" maxlength="12" required="" value="${adminInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="admin.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" maxlength="25" required="" value="${adminInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'passwdHash', 'error')} required">
	<label for="passwdHash">
		<g:message code="admin.passwdHash.label" default="Passwd Hash" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="passwdHash" cols="40" rows="5" maxlength="255" required="" value="${adminInstance?.passwdHash}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: adminInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="admin.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="age" from="${18..100}" class="range" required="" value="${fieldValue(bean: adminInstance, field: 'age')}"/>
</div>

