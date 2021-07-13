<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 이벤트생성</title>
<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
	<%@include file="./common.jsp"%>


	<form action="eventinsertres.do" method="post" class="form-horizontal">
		<input type="hidden" value="EVENT" name="boardkind">
		<div class="border border-danger rounded p-3">
			<div class="form-group">

				<label for="boardtitle" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="boardtitle">
				</div>
			</div>
			<div class="form-group">
				<label for="boardcontent" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea rows="10" cols="60" id="summernote" name="boardcontent"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10" align="right">

					<input type="submit" value="글작성" class="btn btn-success"> <input
						type="button" value="취소" class="btn btn-danger"
						onclick="location.href='eventlist.do'">

				</div>
			</div>
		</div>
	</form>

</body>
<script type="text/javascript" src="resources/js/setsummernote.js"></script>
</html>