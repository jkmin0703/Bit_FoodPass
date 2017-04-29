<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.row {
	padding-left: 30px;
}
</style>

<!-- 내 가게 정보 -->

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">내 가게 정보</h3>
	</div>

	<br>

	<!-- 내 가게 목록 SELECT 박스 -->
	<div class="row">
		<div class="col-md-3">
			<select class="form-control">
				<option>맥도날드</option>
				<option>버거킹</option>
				<option>김가네</option>
				<option>롯데리아</option>
				<option>커피빈</option>
			</select>
		</div>
	</div>

	<!-- 내 가게 목록 테이블 -->
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="text-center gr"><strong>내 가게 이름</strong></td>
						<td>맥도날드</td>
						<td class="text-center gr"><strong>전화번호</strong></td>
						<td>02-123-4567</td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>내 가게 분류</strong></td>
						<td>패스트 푸드</td>
						<td class="text-center gr"><strong>오픈 시간</strong></td>
						<td>오전 09:00</td>
					</tr>
					<tr>
						<td class="text-center gr"><strong>내 가게 주소</strong></td>
						<td>서울시 서초구 서초1동 123-1번지</td>
						<td class="text-center gr"><strong>종료 시간</strong></td>
						<td>오후 24:00</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>