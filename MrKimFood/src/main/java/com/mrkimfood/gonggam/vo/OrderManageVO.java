package com.mrkimfood.gonggam.vo;

import java.sql.Date;
import java.sql.Time;

public class OrderManageVO {
	private Integer orderId; /* 주문ID */
	private Date orderDay;
	private Time orderTime;
	private char paymentWay;
	private Integer paymentSum;
	private Integer restaurantId;
	private Integer tableId;
	private char whetherPayment;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDay() {
		return orderDay;
	}

	public void setOrderDay(Date orderDay) {
		this.orderDay = orderDay;
	}

	public Time getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Time orderTime) {
		this.orderTime = orderTime;
	}

	public char getPaymentWay() {
		return paymentWay;
	}

	public void setPaymentWay(char paymentWay) {
		this.paymentWay = paymentWay;
	}

	public Integer getPaymentSum() {
		return paymentSum;
	}

	public void setPaymentSum(Integer paymentSum) {
		this.paymentSum = paymentSum;
	}

	public Integer getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(Integer restaurantId) {
		this.restaurantId = restaurantId;
	}

	public Integer getTableId() {
		return tableId;
	}

	public void setTableId(Integer tableId) {
		this.tableId = tableId;
	}

	public char getWhetherPayment() {
		return whetherPayment;
	}

	public void setWhetherPayment(char whetherPayment) {
		this.whetherPayment = whetherPayment;
	}

}
