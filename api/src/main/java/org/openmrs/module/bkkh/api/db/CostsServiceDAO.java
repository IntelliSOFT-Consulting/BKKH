package org.openmrs.module.bkkh.api.db;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Costs;

import java.util.List;

/**
 * Created by USER on 01/12/2015.
 */
public interface CostsServiceDAO {
    void saveCosts(Costs costs);

    List<Costs> getCosts(Patient patient);

    Costs getLastCosts(Patient patient);
}
