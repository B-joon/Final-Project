<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PTSD / 공지</title>
	<link href="resources/img/favicon.png" rel="shortcut icon">
</head>
<body>
<%@include file="./common.jsp" %>
	<form class="form-horizontal">
		<div class="border border-danger rounded p-3">
			<div class="form-group">

				<label for="boardname" class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="boardname"
						value="${dto.boardname }" readonly>
				</div>
			</div>

			<div class="form-group">

				<label for="boardtitle" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="boardtitle"
						value="${dto.boardtitle }" readonly>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">

					<textarea class="form-control" rows="3" id="summernote">${dto.boardcontent }</textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10" align="right">
					<input type="button" value="수정" class="btn btn-success"
						onclick="location.href='updateform.do?boardseq=${dto.boardseq}'">
					<input type="button" value="삭제" class="btn btn-danger"
						onclick="location.href='delete.do?boardseq=${dto.boardseq}'">
					<input type="button" value="목록" class="btn btn-info"
						onclick="location.href='noticelist.do'">
				</div>
			</div>
			
		</div>
	</form>

</body>
<script type="text/javascript" src="resources/js/setsummernote.js"></script>
<script type="text/javascript">
$('#summernote').summernote('disable');
</script>
</html>