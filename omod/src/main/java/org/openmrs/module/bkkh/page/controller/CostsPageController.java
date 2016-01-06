package org.openmrs.module.bkkh.page.controller;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Costs;
import org.openmrs.module.bkkh.ModeOfPayment;
import org.openmrs.module.bkkh.api.CostsService;
import org.openmrs.module.emrapi.patient.PatientDomainWrapper;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.BindParams;
import org.openmrs.ui.framework.annotation.InjectBeans;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by gitahi on 24/11/15.
 */
public class CostsPageController {

    public void get
            (
                    @RequestParam("patientId") Patient patient,
                    PageModel model,
                    @InjectBeans PatientDomainWrapper patientDomainWrapper
            ) {
        patientDomainWrapper.setPatient(patient);
        model.addAttribute("patient", patientDomainWrapper);
        model.addAttribute("modeOfPayment", ModeOfPayment.values());
        Costs costs = new Costs();
        costs.setAccountCharged(111111111);
		model.addAttribute("costs", costs);
    }

    public String post
            (
                    @RequestParam("patientId") Patient patient,
                    @ModelAttribute("costs") @BindParams Costs costs,
                    PageModel model,
                    @InjectBeans PatientDomainWrapper patientDomainWrapper,
                    @SpringBean("costsService") CostsService costsService,
                    UiUtils ui,
                    BindingResult bindingResult
            ) {
        costs.setDate(new Date());
        costs.setPatient(patient);
        costsService.saveCosts(costs);
        
        patientDomainWrapper.setPatient(patient);
        model.addAttribute("patient", patientDomainWrapper);
        
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("patientId", patient.getUuid());
        String redirectUrl = "redirect:" + ui.pageLinkWithoutContextPath("coreapps", "clinicianfacing/patient", params);
		return redirectUrl;
    }
}
