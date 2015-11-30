package org.openmrs.module.bkkh.api;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Costs;

import java.util.List;

/**
 * Created by gitahi on 30/11/15.
 */
public interface CostsService {

    void saveCosts(Costs costs);

    List<Costs> getCosts(Patient patient);

    Costs getLastCosts(Patient patient);
}
