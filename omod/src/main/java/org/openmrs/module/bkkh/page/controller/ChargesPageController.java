package org.openmrs.module.bkkh.page.controller;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Charges;
import org.openmrs.module.bkkh.ModeOfPayment;
import org.openmrs.module.bkkh.Payment;
import org.openmrs.module.bkkh.api.ChargesService;
import org.openmrs.module.emrapi.patient.PatientDomainWrapper;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.BindParams;
import org.openmrs.ui.framework.annotation.InjectBeans;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by gitahi on 24/11/15.
 */
public class ChargesPageController {

    public void get
            (
                    @RequestParam("patientId") Patient patient,
                    PageModel model,
                    @InjectBeans PatientDomainWrapper patientDomainWrapper
            ) {
        patientDomainWrapper.setPatient(patient);
        model.addAttribute("patient", patientDomainWrapper);
        model.addAttribute("modeOfPayment", ModeOfPayment.values());
        Charges costs = new Charges();
		model.addAttribute("charges", costs);
    }

    public String post
            (
                    @RequestParam("patientId") Patient patient,
                    @BindParams("charges") Charges charges,
                    @BindParams("payment") Payment payment,
                    PageModel model,
                    @InjectBeans PatientDomainWrapper patientDomainWrapper,
                    @SpringBean("chargesService") ChargesService costsService,
                    UiUtils ui,
                    BindingResult bindingResult
            ) {
        charges.setDate(new Date());
        charges.setPatient(patient);
        payment.setCharges(charges);
        charges.addPayment(payment);
        costsService.saveCharges(charges);
        
        patientDomainWrapper.setPatient(patient);
        model.addAttribute("patient", patientDomainWrapper);
        
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("patientId", patient.getUuid());
        String redirectUrl = "redirect:" + ui.pageLinkWithoutContextPath("coreapps", "clinicianfacing/patient", params);
		return redirectUrl;
    }
}
