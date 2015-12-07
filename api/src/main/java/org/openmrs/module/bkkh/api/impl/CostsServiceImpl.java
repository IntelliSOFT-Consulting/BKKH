package org.openmrs.module.bkkh.api.impl;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Costs;
import org.openmrs.module.bkkh.api.CostsService;
import org.openmrs.module.bkkh.api.db.CostsServiceDAO;

import java.util.List;

/**
 * Created by USER on 01/12/2015.
 */
public class CostsServiceImpl implements CostsService {
    private CostsServiceDAO dao;

    public void setDao(CostsServiceDAO dao) {
        this.dao = dao;
    }

    @Override
    public void saveCosts(Costs costs) {
        dao.saveCosts(costs);
    }

    @Override
    public List<Costs> getCosts(Patient patient) {
        return dao.getCosts(patient);
    }

    @Override
    public Costs getLastCosts(Patient patient) {
        return dao.getLastCosts(patient);
    }
}
