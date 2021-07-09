<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="./common.jsp" %>
	<form action="productinsertres.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category">
						<option value="" disabled selected>카테고리 선택</option>
						<option value="1">뮤지컬</option>
						<option value="2">콘서트</option>
						<option value="3">연극</option>
						<option value="4">클래식/무용</option>
						<option value="5">스포츠</option>
						<option value="6">레저</option>
						<option value="7">전시/행사</option>
						<option value="8">아동/가족</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="productname"></td>
			</tr>
			<tr>
				<th>행사시작일</th>
				<td>
				<input type="date" name="startdate">
				</td>
			</tr>
			<tr>
				<th>행사종료일</th>
				<td>
				<input type="date" name="enddate">
				</td>
			</tr>
			<tr>
				<th>상품썸네일</th>
				<td><input type="file" name="img" accept="image/*"></td>
			</tr>			
			<tr>
				<th>상품내용</th>
				<td><textarea id="summernote" name="productcontent"></textarea></td>
			</tr>	
			<tr>
				<th>장소</th>
				<!-- 호수가 구현한 주소 코드 가져오기 -->
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="tellnumber"></td>
			</tr>	
			<tr>
				<th>관람시간</th>
				<td><input type="text" name="runtime" placeholder="시간"></td>
			</tr>	
			<tr>
				<th>관람등급</th>
				<td>
					<select name="rating">
						<option value="" disabled selected>등급 선택</option>
						<option value="0">전체이용가</option>
						<option value="12">12세 이상 관람가</option>
						<option value="15">15세 이상 관람가</option>
						<option value="19">청소년 관람불가</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>관객수</th>
				<td><input type="text" name="seatcount"></td>
			</tr>
			<tr>
				<th>티켓가격</th>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"> 
				<input type="submit" value="상품등록">
				<input type="button" onclick="history.back();" value="등록취소">
				</td>
			</tr>																	
		</table>
	</form>
</body>
<script type="text/javascript" src="resources/js/setsummernote.js" ></script>
</html>