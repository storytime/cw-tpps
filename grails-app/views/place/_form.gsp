<%@ page import="cw.Place" %>



<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="place.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="price" from="${0..10000}" class="range" required="" value="${fieldValue(bean: placeInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'time', 'error')} required">
	<label for="time">
		<g:message code="place.time.label" default="Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="time" cols="40" rows="5" maxlength="1000" required="" value="${placeInstance?.time}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="place.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${placeInstance.constraints.type.inList}" value="${placeInstance?.type}" valueMessagePrefix="place.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'decription', 'error')} required">
	<label for="decription">
		<g:message code="place.decription.label" default="Decription" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="decription" cols="40" rows="5" maxlength="10000" required="" value="${placeInstance?.decription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="place.image.label" default="Image" />	
	</label>
	<input type="file" name="image" id = "image"/> ${placeInstance.image}
</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'fk_countris', 'error')} required">
	<label for="fk_countris">
		<g:message code="place.fk_countris.label" default="Fkcountris" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="fk_countris" name="fk_countris.id" from="${cw.Country.list()}" optionKey="id" required="" value="${placeInstance?.fk_countris?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'hotNews', 'error')} ">
	<label for="hotNews">
		<g:message code="place.hotNews.label" default="Hot News" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${placeInstance?.hotNews?}" var="h">
    <li><g:link controller="hotNews" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="hotNews" action="create" params="['place.id': placeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'hotNews.label', default: 'HotNews')])}</g:link>
</li>
</ul>

</div>

