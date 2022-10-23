<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 강아지 품종 선택 --%>
<div id="breed_list">
	<select name="${kind}_breed[]" class="selectpicker" data-size="6" multiple>
		<c:forEach var="breed" items="${animalBreedList}">
			<option value="${breed}">${breed}</option>
		</c:forEach>
	</select>
</div>