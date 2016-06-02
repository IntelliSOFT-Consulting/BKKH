package org.openmrs.module.bkkh.page.controller;

import org.openmrs.Patient;
import org.openmrs.Visit;
import org.openmrs.api.context.Context;
import org.openmrs.module.appui.UiSessionContext;
import org.openmrs.module.bkkh.Charges;
import org.openmrs.module.bkkh.Payment;
import org.openmrs.module.bkkh.api.ChargesService;
import org.openmrs.module.emrapi.adt.AdtService;
import org.openmrs.module.emrapi.patient.PatientDomainWrapper;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.annotation.BindParams;
import org.openmrs.ui.framework.annotation.InjectBeans;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.PageModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by gitahi on 24/11/15.
 */
public class ChargesPageController {
    protected Logger log = LoggerFactory.getLogger(ChargesPageController.class);

    public void get
            (
                    @RequestParam("patientId") Patient patient,
                    @RequestParam(value = "chargesId", required = false) Integer chargesId,
                    PageModel model,
                    @InjectBeans PatientDomainWrapper patientDomainWrapper,
                    @SpringBean("chargesService") ChargesService chargesService
            ) {
        patientDomainWrapper.setPatient(patient);
        model.addAttribute("patient", patientDomainWrapper);
        model.addAttribute("modeOfPayment", chargesService.getModeOfPayments());
        model.addAttribute("chargeAccounts", chargesService.getChargeAccounts());
        Charges costs = null;
        if (chargesId != null) {
            costs = chargesService.getCharges(chargesId);
        } else {
            costs = new Charges();
        }
        model.addAttribute("charges", costs);
    }

    public String post
            (
                    @RequestParam("patientId") Patient patient,
                    @RequestParam(value = "accountCharged", required = false) Integer chargeAccountId,
                    @RequestParam(value = "modeOfPayment", required = false) Integer modeOfPaymentId,
                    @BindParams("charges") Charges charges,
                    @BindParams("payment") Payment payment,
                    PageModel model,
                    @InjectBeans PatientDomainWrapper patientDomainWrapper,
                    @SpringBean("chargesService") ChargesService chargesService,
                    UiUtils ui,
                    UiSessionContext session
            ) {
        charges.setPatient(patient);
        charges.setDate(payment.getPaymentDate());
        payment.setCharges(charges);
        if (chargeAccountId != null) {
            payment.setChargeAccount(chargesService.getChargeAccount(chargeAccountId));
        }
        if (modeOfPaymentId != null) {
        	payment.setModeOfPayment(chargesService.getModeOfPayment(modeOfPaymentId));
        }
        try {
            Calendar endOfDay = Calendar.getInstance();
            endOfDay.setTime(payment.getPaymentDate());
            endOfDay.set(Calendar.HOUR_OF_DAY, 23);
            endOfDay.set(Calendar.MINUTE, 59);
            endOfDay.set(Calendar.SECOND, 59);
            Visit visit = Context.getService(AdtService.class).ensureVisit(patient, endOfDay.getTime(), session.getSessionLocation());
            payment.setVisit(visit);
        } catch (IllegalArgumentException e) {
            log.error(e.getMessage());
        }
        charges.addPayment(payment);
        chargesService.saveCharges(charges);
        
        patientDomainWrapper.setPatient(patient);
        model.addAttribute("patient", patientDomainWrapper);
        
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("patientId", patient.getUuid());
        params.put("chargesId", charges.getId());
        String redirectUrl = "redirect:" + ui.pageLinkWithoutContextPath("bkkh", "chargesSummary", params);
        return redirectUrl;
    }
}
