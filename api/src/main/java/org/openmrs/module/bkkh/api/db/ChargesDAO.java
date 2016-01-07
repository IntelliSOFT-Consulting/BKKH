package org.openmrs.module.bkkh.api.db;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Charges;

import java.util.List;

/**
 * Created by USER on 01/12/2015.
 */
public interface ChargesDAO {
    void saveCharges(Charges charges);

    List<Charges> getCharges(Patient patient);

    Charges getLastCharges(Patient patient);
}
