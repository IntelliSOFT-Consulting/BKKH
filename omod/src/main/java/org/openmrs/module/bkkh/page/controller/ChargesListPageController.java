package org.openmrs.module.bkkh.page.controller;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.api.ChargesService;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

public class ChargesListPageController {
	public void get(
			@RequestParam("patientId") Patient patient,
			@SpringBean("chargesService") ChargesService chargesService,
			PageModel model) {
		model.addAttribute("patient", patient);
		model.addAttribute("chargesList", chargesService.getChargesByPatient(patient));
	}
}
