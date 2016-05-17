package org.openmrs.module.bkkh.page.controller;

import java.util.HashMap;
import java.util.Map;

import org.openmrs.Patient;
import org.openmrs.Visit;
import org.openmrs.api.context.Context;
import org.openmrs.module.appui.UiSessionContext;
import org.openmrs.module.bkkh.Charges;
import org.openmrs.module.bkkh.Payment;
import org.openmrs.module.bkkh.api.ChargesService;
import org.openmrs.module.emrapi.adt.AdtService;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.BindParams;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestParam;

public class PaymentPageController {
	protected Logger log = LoggerFactory.getLogger(ChargesPageController.class);
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
		model.addAttribute("modeOfPayment", chargesService.getModeOfPayments());
	}
	
	public String post(
			@RequestParam("chargesId") Integer chargesId,
			@RequestParam(value = "accountCharged", required = false) Integer chargeAccountId,
			@RequestParam(value = "paymentMode", required = false) Integer modeOfPaymentId,
			@BindParams Payment payment,
			@SpringBean("chargesService") ChargesService chargesService,
			UiSessionContext session,
			UiUtils ui) {
		Charges charges = chargesService.getCharges(chargesId);
		if (payment.getId() != null) {
			Payment oldPayment = chargesService.getPayment(payment.getId());
			oldPayment.setPaid(payment.getPaid());
			oldPayment.setPaymentDate(payment.getPaymentDate());
			setChargeAccount(chargeAccountId, chargesService, oldPayment);
			setModeOfPayment(modeOfPaymentId, chargesService, oldPayment);
			payment = oldPayment;
		} else {
			payment.setCharges(charges);
			setChargeAccount(chargeAccountId, chargesService, payment);
			setModeOfPayment(modeOfPaymentId, chargesService, payment);
		}
		try {
			Visit visit = Context.getService(AdtService.class).ensureVisit(
					charges.getPatient(), payment.getPaymentDate(),
					session.getSessionLocation());
			payment.setVisit(visit);
		} catch (IllegalArgumentException e) {
			log.error(e.getMessage());
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
	
	private void setModeOfPayment(Integer modeOfPaymentId, ChargesService chargesService, Payment payment) {
		if (modeOfPaymentId != null) {
			payment.setModeOfPayment(chargesService.getModeOfPayment(modeOfPaymentId));
		}
	}
}
