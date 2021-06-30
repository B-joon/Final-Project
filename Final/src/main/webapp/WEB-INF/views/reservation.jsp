<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PSTD / 상품 예매 페이지</title>
</head>
<body>

<h1>예매하기</h1>
	
<input type="text" name="productseq" value="${dto.productseq }" />
<input type="text" name="category" value="${dto.category }" />
<input type="text" name="productname" value="${dto.productname }" />
<input type="text" name="startdate" value="${dto.startdate }" />
<input type="text" name="enddate" value="${dto.enddate }" />
<input type="text" name="thumbimg" value="${dto.thumbimg }" />
<input type="text" name="productcontent" value="${dto.productcontent }" />
<input type="text" name="areacode" value="${dto.areacode }" />
<input type="text" name="address" value="${dto.address }" />
<input type="text" name="tellnumber" value="${dto.tellnumber }" />
<input type="text" name="runtime" value="${dto.runtime }" />
<input type="text" name="rating" value="${dto.rating }" />
<input type="text" name="seatcount" value="${dto.seatcount }" />
<input type="text" name="likecount" value="${dto.likecount }" />
<input type="text" name="wishcount" value="${dto.wishcount }" />
<input type="text" name="productcount" value="${dto.productcount }" />

</body>
</html>