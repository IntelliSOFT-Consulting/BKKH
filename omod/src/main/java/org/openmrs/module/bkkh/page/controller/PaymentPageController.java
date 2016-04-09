package org.openmrs.module.bkkh.page.controller;

import java.util.HashMap;
import java.util.Map;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Charges;
import org.openmrs.module.bkkh.ModeOfPayment;
import org.openmrs.module.bkkh.Payment;
import org.openmrs.module.bkkh.api.ChargesService;
import org.openmrs.ui.framework.UiUtils;
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
		model.addAttribute("charges", chargesService.getCharges(chargesId));
		model.addAttribute("chargeAccounts", chargesService.getChargeAccounts());
		model.addAttribute("modeOfPayment", ModeOfPayment.values());
	}
	
	public String post(
			@RequestParam("chargesId") Integer chargesId,
			@RequestParam(value = "accountCharged", required = false) Integer chargeAccountId,
			@BindParams Payment payment,
			@SpringBean("chargesService") ChargesService chargesService,
			UiUtils ui) {
		Charges charges = chargesService.getCharges(chargesId);
		if (payment.getId() != null) {
			Payment oldPayment = chargesService.getPayment(payment.getId());
			oldPayment.setPaid(payment.getPaid());
			setChargeAccount(chargeAccountId, chargesService, oldPayment);
			oldPayment.setModeOfPayment(payment.getModeOfPayment());
			payment = oldPayment;
		} else {
			payment.setCharges(charges);
			setChargeAccount(chargeAccountId, chargesService, payment);
		}
		charges.addPayment(payment);
		chargesService.saveCharges(charges);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("patientId", charges.getPatient().getUuid());
		params.put("chargesId", chargesId);
		String redirectUrl = "redirect:" + ui.pageLinkWithoutContextPath("bkkh", "chargesSummary", params);
		return redirectUrl;
	}

	private void setChargeAccount(Integer chargeAccountId,
			ChargesService chargesService, Payment payment) {
		if (chargeAccountId != null) {
			payment.setChargeAccount(chargesService.getChargeAccount(chargeAccountId));
		}
	}
}
