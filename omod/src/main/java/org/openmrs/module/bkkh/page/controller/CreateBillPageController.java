package org.openmrs.module.bkkh.page.controller;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.api.SettingsService;
import org.openmrs.module.emrapi.patient.PatientDomainWrapper;
import org.openmrs.ui.framework.annotation.InjectBeans;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;

/**
 * Created by gitahi on 24/11/15.
 */
public class CreateBillPageController {

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
                    @RequestParam("name") String name,
                    @RequestParam("description") String description,
                    @RequestParam("cost") BigDecimal cost,
                    @SpringBean SettingsService settingsService,
                    PageModel model,
                    @InjectBeans PatientDomainWrapper patientDomainWrapper
            ) {
        patientDomainWrapper.setPatient(patient);
        model.addAttribute("patient", patientDomainWrapper);
        System.out.println("hey " + patient.getId());
    }
}
