/**
 * 
 */

function showOrderList() {
		
	$('#orderFoodGroup').empty();
	
	setOrderInfoCookie();
	
	sum = 0; //합계
	
	var content = ""; 
	for (var i in orderInfos) {
		content += "<label for='order" + i + "'>" + orderInfos[i].foodName + " " +
		"<p>" + orderInfos[i].price + "원 * " + orderInfos[i].quantity + "개 </p>" + 
		"</label>" + 
		"<input type='checkbox' name='orderFoodList' id='order" + i + "' value='" + orderInfos[i].foodName + "' >";
		sum += (orderInfos[i].price * orderInfos[i].quantity);
	}
	$('#orderFoodGroup').append(content);
	
	$("#orderFood").trigger('create');
	
	document.getElementById("payDisplay").innerHTML="결제금액 : " + sum + " 원";
}

function selectDel() {
	
	for (var i in orderInfos) {
		var orderId = document.getElementById("order" + i);
		console.log("orderId = " + orderId);
		if(orderId.checked) {
			delete(orderInfos[i]);
		}
	}
	
	showOrderList();
}








