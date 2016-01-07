package org.openmrs.module.bkkh;

import java.util.Date;

import org.openmrs.BaseOpenmrsObject;

public class Payment extends BaseOpenmrsObject {

	private Integer paymentId;
	private boolean nhif;
	private double paid;
	private Date paymentDate;
	private String accountCharged;

	public Integer getId() {
		return getPaymentId();
	}

	public void setId(Integer id) {
		setPaymentId(id);
	}

	public Integer getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(Integer paymentId) {
		this.paymentId = paymentId;
	}

	public boolean isNhif() {
		return nhif;
	}

	public void setNhif(boolean nhif) {
		this.nhif = nhif;
	}

	public double getPaid() {
		return paid;
	}

	public void setPaid(double paid) {
		this.paid = paid;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getAccountCharged() {
		return accountCharged;
	}

	public void setAccountCharged(String accountCharged) {
		this.accountCharged = accountCharged;
	}

}
