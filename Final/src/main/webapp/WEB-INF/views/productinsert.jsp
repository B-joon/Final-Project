<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 상품 정보 생성</title>
</head>
<body>
<%@include file="./common.jsp" %>
	<h3 class="display-4">상품 정보 생성</h3>
	<form action="productinsertres.do" method="post" enctype="multipart/form-data">
		<div class="border border-danger rounded p-3">	
		<div class="form-row">    	
		    <div class="form-group col-md-12">
		      <label for="inputProductname">상품명</label>
		      <input name="productname" type="text" class="form-control" id="inputProductname" placeholder="ex) 월드뮤직페스티벌 2021">
		    </div>			
		</div>
		<div class="form-row">
		    <div class="form-group col-md-4">
		      <label for="categorySelect">카테고리</label>
		      <select name="category" id="categorySelect" class="custom-select">
				<option value="" disabled selected>카테고리 선택</option>
				<option value="뮤지컬">뮤지컬</option>
				<option value="콘서트">콘서트</option>
				<option value="연극">연극</option>
				<option value="클래식/무용">클래식/무용</option>
				<option value="스포츠">스포츠</option>
				<option value="레저">레저</option>
				<option value="전시/행사">전시/행사</option>
				<option value="아동/가족">아동/가족</option>
		      </select>
		    </div>
		    <div class="form-group col-md-4">
		      <label for="categorySelect2">관람등급</label>
	      		<select name="rating" id="categorySelect2" class="custom-select">
					<option value="" disabled selected>등급 선택</option>
					<option value="0">전체이용가</option>
					<option value="12">12세 이상 관람가</option>
					<option value="15">15세 이상 관람가</option>
					<option value="19">청소년 관람불가</option>
				</select>
		    </div>		
		    <div class="form-group col-md-4">
		      <label for="inputRuntime">관람시간</label>
		      <input name="runtime" type="text" class="form-control" id="inputRuntime" placeholder="ex) 2시간 or 120분">
		    </div>			        	
		</div>
		<div class="form-row">    	
		    <div class="form-group col-md-4">
		      <label for="inputTellnumber">전화번호</label>
		      <input name="tellnumber" type="text" class="form-control" id="inputTellnumber" placeholder="ex) 02-1234-5678">
		    </div>			
		    <div class="form-group col-md-4">
		      <label for="inputSeatcount">관객수</label>
		      <input name="seatcount" type="text" class="form-control" id="inputSeatcount" placeholder="ex) 1000">
		    </div>			
		    <div class="form-group col-md-4">
		      <label for="inputPrice">티켓가격</label>
		      <input name="price" type="text" class="form-control" id="inputPrice" placeholder="ex) 100000">
		    </div>			
		</div>
		<div class="form-row">    	
		    <div class="form-group col-md-6">
		      <label for="inputStartdate">행사시작일</label>
		      <input name="startdate" type="date" class="form-control" id="inputStartdate">
		    </div>		
		    <div class="form-group col-md-6">
		      <label for="inputEnddate">행사종료일</label>
		      <input name="enddate" type="date" class="form-control" id="inputEnddate">
		    </div>		
		</div>				
		<div class="form-row">    	
		    <div class="form-group col-md-12">
		      <label for="inputAddress">주소</label>
		      <input name="address" type="text" class="form-control" id="inputAddress" readonly="readonly"
					placeholder="주소를 입력하려면 여기를 클릭하세요" onclick="goPopup();">
		    </div>			
		</div>		
		<div class="form-row">    	
		    <div class="form-group col-md-12">
		      <label for="inputImg">상품썸네일</label>
		      <div class="custom-file">
				  <input name="img" type="file" class="custom-file-input" id="customFile" accept="image/*">
				  <label class="custom-file-label" for="customFile">파일 선택</label>
			  </div>
		    </div>		
		</div>
		<div class="form-group">
		    <label for="exampleFormControlTextarea1">상품내용</label>
		    <textarea id="summernote" name="productcontent" class="form-control" rows="3"></textarea>
		</div>
		<button type="submit" class="btn btn-danger">상품등록</button>
		<button type="button" class="btn btn-dark"onclick="location.href='admin.do'">등록취소</button>
		</div>
	</form>
</body>
<script type="text/javascript">
function goPopup() {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	// scrollbars=yes 스크롤 바 가능 resizable=yes 팝업창 크기 조절 가능 
	var pop = window.open("popup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
// 값 불러와서 id가 address...등에 각 값에 넣고 나머지 주소가 30글자보다 크면 너무길다고 리턴
function jusoCallBack(roadFullAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
	document.getElementById("inputAddress").value = roadFullAddr;
}
</script>
<script type="text/javascript" src="resources/js/setsummernote.js" ></script>
</html>