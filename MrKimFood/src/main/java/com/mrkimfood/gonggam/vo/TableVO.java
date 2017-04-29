package com.mrkimfood.gonggam.vo;

public class TableVO {
	private int tableId; /* 테이블ID */
	private int no; /* 테이블 번호 */
	private String qrCode; /* QR코드 */
	private int restaurantId; /* 음식점ID */
	private String isUseTable; /* 테이블 사용여부 */

	public int getTableId() {
		return tableId;
	}

	public void setTableId(int tableId) {
		this.tableId = tableId;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getQrCode() {
		return qrCode;
	}

	public void setQrCode(String qrCode) {
		this.qrCode = qrCode;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getIsUseTable() {
		return isUseTable;
	}

	public void setIsUseTable(String isUseTable) {
		this.isUseTable = isUseTable;
	}

}
