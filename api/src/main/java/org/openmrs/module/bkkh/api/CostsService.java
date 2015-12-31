package org.openmrs.module.bkkh.api;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Costs;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by gitahi on 30/11/15.
 */
public interface CostsService {

    @Transactional
    void saveCosts(Costs costs);

    @Transactional(readOnly=true)
    List<Costs> getCosts(Patient patient);

    @Transactional(readOnly=true)
    Costs getLastCosts(Patient patient);
}
