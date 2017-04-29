package com.mrkimfood.gonggam.vo;

public class OrderMenuVO {
	private Integer orderId;
	private Integer foodId;
	private String isSupply;
	private Integer num;
	private Integer count;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getFoodId() {
		return foodId;
	}

	public void setFoodId(Integer foodId) {
		this.foodId = foodId;
	}

	public String getIsSupply() {
		return isSupply;
	}

	public void setIsSupply(String isSupply) {
		this.isSupply = isSupply;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
}
