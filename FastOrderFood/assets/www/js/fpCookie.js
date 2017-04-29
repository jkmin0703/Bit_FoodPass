//var connIp = "http://125.131.112.30:7080";
//var connIp = "http://localhost:8080";
var connIp = "http://61.77.88.153:7000";


/*
 * cookie 관리 function (Menu 관련)
 */
function fpSetCookie(key, value) {
	var storage;
	if (window.sessionStorage) {
		storage = window.sessionStorage;
	} else if (window.localStorage) {
		storage = window.localStorage;
	} else {
		console.log("STORAGE를 사용할 수 없습니다.");
		return;
	}
	storage.setItem(key, value);
}

function fpGetCookie(key) {
	var storage;
	if (window.sessionStorage) {
		storage = window.sessionStorage;
	} else if (window.localStorage) {
		storage = window.localStorage;
	} else {
		console.log("해당 정보가 없습니다.");
		return null;
	}
	return storage.getItem(key);
}

function fpRemoveCookie(key) {
	var storage;
	if (window.sessionStorage) {
		storage = window.sessionStorage;
	} else if (window.localStorage) {
		storage = window.localStorage;
	} else {
		alert("STORAGE를 사용할 수 없습니다.");
		return;
	}
	storage.removeItem(key);
}


/*
 * cookie 관리 function (Member 관련)
 */
function fpMemberSetCookie(key, value) {
	var storage;
	if (window.localStorage) {
		storage = window.localStorage;
	} else if (window.sessionStorage) {
		storage = window.sessionStorage;
	} else {
		console.log("STORAGE를 사용할 수 없습니다.");
		return;
	}
	storage.setItem(key, value);
}

function fpMemberGetCookie(key) {
	var storage;
	if (window.localStorage) {
		storage = window.localStorage;
	} else if (window.sessionStorage) {
		storage = window.sessionStorage;
	} else {
		console.log("해당 정보가 없습니다.");
		return null;
	}
	return storage.getItem(key);
}

function fpMemberRemoveCookie(key) {
	var storage;
	if (window.localStorage) {
		storage = window.localStorage;
	} else if (window.sessionStorage) {
		storage = window.sessionStorage;
	} else {
		alert("STORAGE를 사용할 수 없습니다.");
		return;
	}
	storage.removeItem(key);
}
