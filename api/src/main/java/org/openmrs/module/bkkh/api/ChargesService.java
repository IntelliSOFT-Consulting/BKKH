package org.openmrs.module.bkkh.api;

import java.util.List;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Charges;
import org.openmrs.module.bkkh.Payment;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by gitahi on 30/11/15.
 */
public interface ChargesService {

    @Transactional
    void saveCharges(Charges charges);

    @Transactional(readOnly=true)
    List<Charges> getChargesByPatient(Patient patient);

    @Transactional(readOnly=true)
    Charges getCharges(Integer chargesId);

    @Transactional(readOnly=true)
    Charges getLastCharges(Patient patient);

	Payment getPayment(Integer paymentId);
}
