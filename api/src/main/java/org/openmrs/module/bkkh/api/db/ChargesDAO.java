package org.openmrs.module.bkkh.api.db;

import java.util.List;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Charges;
import org.openmrs.module.bkkh.Payment;

/**
 * Created by USER on 01/12/2015.
 */
public interface ChargesDAO {
    void saveCharges(Charges charges);

    List<Charges> getChargesByPatient(Patient patient);

    Charges getCharges(Integer chargesId);

    Charges getLastCharges(Patient patient);

	Payment getPayment(Integer paymentId);
}
