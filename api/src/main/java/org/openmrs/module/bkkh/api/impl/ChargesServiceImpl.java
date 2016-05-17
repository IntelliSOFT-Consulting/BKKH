package org.openmrs.module.bkkh.api.impl;

import org.openmrs.Patient;
import org.openmrs.module.bkkh.ChargeAccount;
import org.openmrs.module.bkkh.Charges;
import org.openmrs.module.bkkh.ModeOfPayment;
import org.openmrs.module.bkkh.Payment;
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
	public Charges getCharges(Integer chargesId) {
		return dao.getCharges(chargesId);
	}

	@Override
	public Payment getPayment(Integer paymentId) {
		return dao.getPayment(paymentId);
	}

	@Override
	public List<ChargeAccount> getChargeAccounts() {
		return dao.getChargeAccounts();
	}

	@Override
	public ChargeAccount getChargeAccount(Integer chargeAccountId) {
		return dao.getChargeAccount(chargeAccountId);
	}

	@Override
	public List<ModeOfPayment> getModeOfPayments() {
		return dao.getModeOfPayments();
	}

	@Override
	public ModeOfPayment getModeOfPayment(Integer modeOfPaymentId) {
		return dao.getModeOfPayment(modeOfPaymentId);
	}
}
