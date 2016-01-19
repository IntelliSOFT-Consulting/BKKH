package org.openmrs.module.bkkh;

import org.hamcrest.Matchers;
import org.junit.Assert;
import org.junit.Test;

public class ChargesTest {

	@Test
	public void getBalanceShouldReturnTotalChargesLessTotalPayments() {
		Charges charges = new Charges();
		charges.setStay(450.50D);
		charges.setFile(100.60D);
		charges.setDoctor(250.00);
		Payment payment = new Payment();
		payment.setPaid(250.00);
		charges.addPayment(payment);
		
		double balance = charges.getBalance();
		
		Assert.assertThat(balance, Matchers.equalTo(450.50D + 100.60D));
	}
	
	@Test
	public void balanceShouldEqualTotalChargesWhenNoPaymentsMade() {
		Charges charges = new Charges();
		charges.setStay(450.50D);
		charges.setFile(100.60D);
		charges.setDoctor(250.00);
		
		Double balance = charges.getBalance();
		
		Assert.assertThat(balance, Matchers.equalTo(charges.getTotal()));
	}
	
	@Test public void balanceShouldEqualTotalChargesWhenPaymentOfZeroMade() {
		Charges charges = new Charges();
		charges.setStay(450.50D);
		charges.setFile(100.60D);
		charges.setDoctor(250.00);
		Payment payment = new Payment();
		charges.addPayment(payment);
		
		double balance = charges.getBalance();
		
		Assert.assertThat(balance, Matchers.equalTo(450.50D + 100.60D + 250.00D));
	}

}
