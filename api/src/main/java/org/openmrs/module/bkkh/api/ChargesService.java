package org.openmrs.module.bkkh.api;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Charges;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by gitahi on 30/11/15.
 */
public interface ChargesService {

    @Transactional
    void saveCharges(Charges charges);

    @Transactional(readOnly=true)
    List<Charges> getCharges(Patient patient);

    @Transactional(readOnly=true)
    Charges getLastCharges(Patient patient);
}
