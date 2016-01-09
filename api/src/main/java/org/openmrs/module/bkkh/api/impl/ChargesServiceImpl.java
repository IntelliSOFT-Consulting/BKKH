package org.openmrs.module.bkkh.api.impl;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.Charges;
import org.openmrs.module.bkkh.api.ChargesService;
import org.openmrs.module.bkkh.api.db.ChargesDAO;

import java.util.List;

/**
 * Created by USER on 01/12/2015.
 */
public class ChargesServiceImpl implements ChargesService {
    private ChargesDAO dao;

    public void setDao(ChargesDAO dao) {
        this.dao = dao;
    }

    @Override
    public void saveCharges(Charges costs) {
        dao.saveCharges(costs);
    }

    @Override
    public List<Charges> getChargesByPatient(Patient patient) {
        return dao.getChargesByPatient(patient);
    }

    @Override
    public Charges getLastCharges(Patient patient) {
        return dao.getLastCharges(patient);
    }

	@Override
	public Charges getCharges(long chargesId) {
		return dao.getCharges(chargesId);
	}
}
