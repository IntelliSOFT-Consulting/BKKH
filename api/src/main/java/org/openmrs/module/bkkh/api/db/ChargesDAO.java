package org.openmrs.module.bkkh.api.db;

import java.util.List;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Charges;

/**
 * Created by USER on 01/12/2015.
 */
public interface ChargesDAO {
    void saveCharges(Charges charges);

    List<Charges> getChargesByPatient(Patient patient);

    Charges getCharges(long chargesId);

    Charges getLastCharges(Patient patient);
}
