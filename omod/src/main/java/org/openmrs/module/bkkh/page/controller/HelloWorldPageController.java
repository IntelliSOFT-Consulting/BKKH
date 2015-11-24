package org.openmrs.module.bkkh.page.controller;

import org.openmrs.Patient;
import org.openmrs.api.PatientService;
import org.openmrs.module.emrapi.patient.PatientDomainWrapper;
import org.openmrs.ui.framework.annotation.InjectBeans;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;

/**
 * Created by gitahi on 24/11/15.
 */
public class HelloWorldPageController {

    public void controller(
            @SpringBean("patientService") PatientService patientService,
            PageModel model,
            @InjectBeans PatientDomainWrapper patientDomainWrapper) {
        Patient patient = patientService.getPatient(23);
        patientDomainWrapper.setPatient(patient);
        model.addAttribute("patient", patientDomainWrapper);
    }
}
