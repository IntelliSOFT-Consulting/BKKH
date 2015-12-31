package org.openmrs.module.bkkh;

public enum ModeOfPayment {
	
	NHIF("bkkh.nhif"),
	INDIVIDUAL("bkkh.individual"),
	GOVTSPONSORED("bkkh.govtsponsored"),
	NGOSPONSORED("bkkh.ngosponsored"),
	INSURANCE("bkkh.insurance");
	
	private String messageKey;
	
	public String getMessageKey() {
		return messageKey;
	}
	
	private ModeOfPayment(String key) {
		this.messageKey = key;
	}

}
