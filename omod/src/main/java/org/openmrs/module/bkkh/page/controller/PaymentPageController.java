package org.openmrs.module.bkkh.page.controller;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Charges;
import org.openmrs.module.bkkh.ModeOfPayment;
import org.openmrs.module.bkkh.Payment;
import org.openmrs.module.bkkh.api.ChargesService;
import org.openmrs.ui.framework.annotation.BindParams;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

public class PaymentPageController {
	public void get(
			@RequestParam("patientId") Patient patient,
			@RequestParam("chargesId") Integer chargesId,
			@RequestParam( value = "paymentId", required = false) Integer paymentId,
			@SpringBean("chargesService") ChargesService chargesService,
			PageModel model) {
		Payment payment = null;
		if (paymentId != null) {
			payment = chargesService.getPayment(paymentId);
		} else {
			payment = new Payment();
		}
		
		model.addAttribute("patient", patient);
		model.addAttribute("payment", payment);
		model.addAttribute("chargesId", chargesId);
		model.addAttribute("modeOfPayment", ModeOfPayment.values());
	}
	
	public void post(
			@RequestParam("chargesId") Integer chargesId,
			@BindParams Payment payment,
			@SpringBean("chargesService") ChargesService chargesService) {
		Charges charges = chargesService.getCharges(chargesId);
		payment.setCharges(charges);
		charges.addPayment(payment);
		chargesService.saveCharges(charges);
	}
}
