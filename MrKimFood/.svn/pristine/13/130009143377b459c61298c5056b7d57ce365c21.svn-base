/**
 * 
 */

function sendData(sendType, sendUrl, sendData) {
	var json_data = JSON.stringify(sendData);
	console.log(json_data);
	
	$.ajax({
		type: sendType,
		url: sendUrl,
		dataType: "jsonp",
		data: {"data":json_data},
		success: function (data) {
			console.log("데이터 수신");
			console.log(data);
		},
		error: function(xhr,status,error){
			console.log("에러발생");
		}
	});
}

function recvData(recvType, recvUrl, cbFunction) {
	$.ajax({
		type: recvType,
		url: recvUrl,
		dataType: "jsonp",
		success: function(data) {
			console.log(data);
			cbFunction(data);
		},
		complete : function(data){
			console.log(data);
		},
		error : function(xhr,status,error){
			alert("에러발생");
		}
	});
}