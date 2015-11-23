package org.openmrs.module.bkkh.api.impl;

import org.openmrs.module.bkkh.Billable;
import org.openmrs.module.bkkh.PaymentMethod;
import org.openmrs.module.bkkh.TransactionType;
import org.openmrs.module.bkkh.api.SettingsService;
import org.openmrs.module.bkkh.api.db.SettingsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by gitahi on 23/11/15.
 */
@Service
public class SettingsServiceImpl implements SettingsService {

    @Autowired
    private SettingsDao settingsDao;

    @Override
    public void savePaymentMethod(PaymentMethod paymentMethod) {
        settingsDao.savePaymentMethod(paymentMethod);
    }

    @Override
    public void deletePaymentMethod(Integer paymentMethodId) {
        settingsDao.deletePaymentMethod(paymentMethodId);
    }

    @Override
    public List<PaymentMethod> getPaymentMethods() {
        return settingsDao.getPaymentMethods();
    }

    @Override
    public PaymentMethod getPaymentMethodById(Integer paymentMethodId) {
        return settingsDao.getPaymentMethodById(paymentMethodId);
    }


    @Override
    public void saveBillable(Billable billable) {
        settingsDao.saveBillable(billable);
    }

    @Override
    public void deleteBillable(Integer billableId) {
        settingsDao.deleteBillable(billableId);
    }

    @Override
    public List<Billable> getBillables() {
        return settingsDao.getBillables();
    }

    @Override
    public Billable getBillableById(Integer billableId) {
        return settingsDao.getBillableById(billableId);
    }

    @Override
    public void saveTransactionType(TransactionType transactionType) {
        settingsDao.saveTransactionType(transactionType);
    }

    @Override
    public void deleteTransactionType(Integer transactionTypeId) {
        settingsDao.deleteTransactionType(transactionTypeId);
    }

    @Override
    public List<TransactionType> getTransactionTypes() {
        return settingsDao.getTransactionTypes();
    }

    @Override
    public TransactionType getTransactionTypeById(Integer transactionTypeId) {
        return settingsDao.getTransactionTypeById(transactionTypeId);
    }
}
