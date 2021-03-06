<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/com/dditUtils.js?v=1"></script>
	<script type="text/javascript" src="../../js/member/memberNew.js?v=1"></script>
<!--     <script type="text/javascript" src="../../js/lib/moment.min.js"></script> -->
<!--     <script type="text/javascript" src="../../js/lib/daterangepicker.js"></script> -->
<!--     <script type="text/javascript" src="../../js/comm/ui.js"></script> -->

<link rel="stylesheet" href="../../js/lib/jquery-ui.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
  <script src="../../js/lib/jquery-ui.js"></script>
  <script src="../../js/lib/datepicker-ko.js"></script>

	
	<style type="text/css">
	.container .form-horizontal .form-group:first-child {border-top: 1px solid;}
	.container .form-horizontal .form-group {
		border-bottom: 1px solid;
		padding: 5px 0px;
		margin: 0 -15px;
		background-color: aliceblue;
	}
	.container .form-horizontal .form-group .control-label {}
	.form-button {padding: 10px 0px;}
	.form-inline .form-inline-zip1 {width: 90px;}
	.form-inline .form-inline-zip2 {width: calc(100% - 90px - 54px);}
	.form-group-inner-down{width: 100%; margin-top: 5px;}
	.form-group-inner-down .form-control{width: 100%}
	.form-control1{width: 50%;}
	.form-control {padding-left: 16px;}
	.form-control:required {background:#fff url(../../images/bg-required.png) no-repeat left 7px center}
	.form-control:disabled, .form-control[readonly] {background: #f2f5fa;}
	
	
	.form-control.singleDate {min-width:125px;padding-right:25px;background:#fff url(../../images/ico-date.png) no-repeat right 7px center}
	.form-control.singleDate:required{background:#fff url(../../images/bg-required.png) no-repeat left 7px center, url(../../images/ico-date.png) no-repeat right 5px center}
	
	</style>
</head>
<body>
	<!-- ???????????? ?????? -->
	<div class="container">
		<h2>?????? ??????</h2>
		<form class="form-horizontal" id="fm">
			<div class="form-group">
				<label class="control-label col-sm-2" for="memId">ID</label>
				<div class="col-sm-10 form-inline">
					<input type="text" class="form-control" id="memId" placeholder="id??? ???????????????" name="memId" required>
					<button type="button" class="btn btn-default btn-sm" id="btnMemId" onclick="chkId()">????????????</button>
					<span id="spMemId" style="display: none;">?????? ???????????? ?????? ?????? ??????. 3~15??????</span>
					<input type="hidden" id="checkedMemId" >
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memName">??????</label>
				<div class="col-sm-10">
					<input type="text" class="form-control form-control1" id="memName" placeholder="????????? ???????????????" name="memName" required>
					<span id="spMemName" style="display: none;">?????? ???????????? ?????? ?????? ??????. 2~20??????</span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memPass">????????????</label>
				<div class="col-sm-10">
					<input type="password" class="form-control form-control1" id="memPass" placeholder="??????????????? ???????????????" name="memPass" required>
					<span id="spMemPass" style="display: none;">????????? ????????? ????????? 8~15??????</span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memPass">???????????? ??????</label>
				<div class="col-sm-10">
					<input type="password" class="form-control form-control1" id="memPass1" placeholder="??????????????? ???????????????" name="memPass" required>
					<span id="spMemPass1" style="display: none;">??????????????? ???????????? ????????????.</span>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-sm-2" for="memMail">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control form-control1" id="memMail" name="memMail" placeholder="email??? ???????????????" required>
					<span id="spMemMail" style="display: none;">????????? ????????? ????????? ????????????.</span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memId">??????</label>
				<div class="col-sm-10 form-inline">
					<input type="text" class="form-control form-inline-zip1" id="memZip" name="memZip" readonly="readonly" required>
					<button type="button" class="btn btn-info btn-sm" id="btnAddr" onclick="openZip()">??????</button>
					<input type="text" class="form-control form-inline-zip2" id="memAdd1" name="memAdd1" readonly="readonly" required>
					<br>
					<div class="form-group-inner-down">
					<input type="text" class="form-control" id="memAdd2" name="memAdd2" placeholder="??????????????? ???????????????" required>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memBir">????????????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control singleDate" id="memBir" name="memBir" placeholder="??????????????? ???????????????" required>
				</div>
				<label class="control-label col-sm-2" for="memHp">???????????????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="memHp" name="memHp" placeholder="?????????????????? ???????????????" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memMemorial">?????????</label>
				<div class="col-sm-10 form-inline">
					?????? : <select class="form-control" id="memMemorial" name="memMemorial"></select>
					?????? : <input type="text" class="form-control singleDate" id="memMemorialday" name="memMemorialday">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="recvEmail">????????????</label>
				<div class="col-sm-4">
					<label class="radio-inline"><input type="radio" name="recvEmailYn" value="Y" checked>??????</label>
					<label class="radio-inline"><input type="radio" name="recvEmailYn" value="N" >?????????</label>
				</div>
				<label class="control-label col-sm-2" for="memJob">??????</label>
				<div class="col-sm-4">
					<select class="form-control" id="memJob" name="memJob">
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="hobby">??????</label>
				<div class="col-sm-10" id="divHobby">
				</div>
			    <input type="hidden" name="memLike" id="memLike">
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="memComment">Comment</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="5" id="memComment" name="memComment" maxlength="1000"></textarea>
				</div>
			</div>
			<input type="hidden" name="action" id="actionFm">
		</form>
		<div class="form-button text-center">
			<button type="button" class="btn btn-primary" onclick="save()">??????</button>
			<button type="button" class="btn btn-default" onclick="goList()">??????</button>
		</div>
	</div>
	
	<!-- ???????????? ?????? Modal -->
	<div class="modal fade" id="zipModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">?????? ??????</h5>
				</div>
				<div class="modal-body">
					???: <select id="city" onchange="setGu()">
						<option value="">???????????????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
						<option value="??????">??????</option>
					</select>
					???: <select id="gu" onchange="setDong()" disabled="disabled">
						<option>???????????????</option>
					</select>
					???: <select id="dong" disabled="disabled">
						<option>???????????????</option>
					</select>
					<button type="button" onclick="searchZipCode()" id="btnZip">??????</button>
					<hr>
					<div id="divZipResult" style="display: none;">
						<table class="table table-striped" id="tbZipResult">
						  <thead>
						    <tr>
						      <th>????????????</th>
						      <th>??????</th>
						    </tr>
						  </thead>
						  <tbody>
						  </tbody>
						</table>
					</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btnCloseZipModal">??????</button>
				</div>
			</div>
		</div>
	</div>
	
	<form id="tmpFm">
		<input type="hidden" name="action" id="actionTmlFm">
		<input type="hidden" name="memId" id="selectedMemId">
		<input type="hidden" name="targetUrl" id="targetUrl">
	</form>
	<!-- ???????????? ??? -->

</body>
</html>