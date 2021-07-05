<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PTSD / 상품정보수정</title>
</head>
<body>
<%@include file="./common.jsp" %>
	<form action="productupdateres.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="productseq" value="${dto.productseq }">
		<table border="1">
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category">
						<option value="" disabled>카테고리 선택</option>
						<option value="1" <c:if test="${dto.category == 1}">selected</c:if>>뮤지컬</option>
						<option value="2" <c:if test="${dto.category == 2}">selected</c:if>>콘서트</option>
						<option value="3" <c:if test="${dto.category == 3}">selected</c:if>>연극</option>
						<option value="4" <c:if test="${dto.category == 4}">selected</c:if>>클래식/무용</option>
						<option value="5" <c:if test="${dto.category == 5}">selected</c:if>>스포츠</option>
						<option value="6" <c:if test="${dto.category == 6}">selected</c:if>>레저</option>
						<option value="7" <c:if test="${dto.category == 7}">selected</c:if>>전시/행사</option>
						<option value="8" <c:if test="${dto.category == 8}">selected</c:if>>아동/가족</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="productname" value="${dto.productname }"></td>
			</tr>
			<tr>
				<th>행사시작일</th>
				<td>
				<input type="date" name="startdate" value="${dto.startdate }">
				</td>
			</tr>
			<tr>
				<th>행사종료일</th>
				<td>
				<input type="date" name="enddate" value="${dto.enddate }">
				</td>
			</tr>
			<tr>
				<th>상품썸네일</th>
				<td>
				<img alt="img" src="${dto.thumbimg }">
				<input type="file" name="img" accept="image/*"></td>
			</tr>			
			<tr>
				<th>상품내용</th>
				<td><textarea rows="10" cols="60" name="productcontent">${dto.productcontent }</textarea></td>
			</tr>	
			<tr>
				<th>장소</th>
				<!-- 호수가 구현한 주소 코드 가져오기 -->
				<td><input type="text" name="address" value="${dto.address }"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="tellnumber" value="${dto.tellnumber }"></td>
			</tr>	
			<tr>
				<th>관람시간</th>
				<td><input type="text" name="runtime" placeholder="시간" value="${dto.runtime }"></td>
			</tr>	
			<tr>
				<th>관람등급</th>
				<td>
					<select name="rating">
						<option value="" disabled>등급 선택</option>
						<option value="0" <c:if test="${dto.rating == 0}">selected</c:if>>전체이용가</option>
						<option value="12" <c:if test="${dto.rating == 12}">selected</c:if>>12세 이상 관람가</option>
						<option value="15" <c:if test="${dto.rating == 15}">selected</c:if>>15세 이상 관람가</option>
						<option value="19" <c:if test="${dto.rating == 19}">selected</c:if>>청소년 관람불가</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"> 
				<input type="submit" value="상품수정">
				<input type="button" onclick="location.href='admin.do'" value="등록취소">
				</td>
			</tr>																	
		</table>
	</form>

</body>
</html>