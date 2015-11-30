package org.openmrs.module.bkkh.page.controller;

import org.openmrs.Patient;
import org.openmrs.module.emrapi.patient.PatientDomainWrapper;
import org.openmrs.ui.framework.annotation.InjectBeans;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;

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
    }

    public void post
            (
                    @RequestParam("patientId") Patient patient,
                    @RequestParam("stay") BigDecimal stay,
                    @RequestParam("procedure") BigDecimal procedure,
                    @RequestParam("anaesthesia") BigDecimal anaesthesia,
                    PageModel model,
                    @InjectBeans PatientDomainWrapper patientDomainWrapper
            ) {
        patientDomainWrapper.setPatient(patient);
        model.addAttribute("patient", patientDomainWrapper);
        System.out.println("hey " + patient.getId());
    }
}
