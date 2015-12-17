/**
 * 관리자 회원정보 관리에서 회원 상태를 변경하는 js
 */
// 회원 상태 select 박스가 변경되었을때 호출됨
function changeStatus(mem_no) {
	var selected_status=$("#memStatus"+mem_no+" option:selected").val();
	/* alert(selected); */
	$.ajax({
		url: "/admin/member/adminMemberUpdate.ajax?mem_no="+mem_no+"&mem_status_code="+selected_status,
		type:"get",
		dataType:"text",
		success: changeStatusSuccess,
		error:function(xhr, status, errorMsg){
			alert(xhr+","+status+","+errorMsg);
		}
	});
}
//변경 성공시 selected로 변경하는 함수
function changeStatusSuccess(check) {
	//alert("회원상태가 수정되었습니다.");
	everywhereAlert("상태 변경 메세지","회원상태가 수정되었습니다.");
}