package org.openmrs.module.bkkh.api.db.hibernate;

import org.openmrs.module.bkkh.Billable;
import org.openmrs.module.bkkh.PaymentMethod;
import org.openmrs.module.bkkh.TransactionType;
import org.openmrs.module.bkkh.api.db.SettingsDao;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by gitahi on 23/11/15.
 */
@Repository
public class HibernateSettingsDao implements SettingsDao {

    @Override
    public void savePaymentMethod(PaymentMethod paymentMethod) {

    }

    @Override
    public void deletePaymentMethod(Integer paymentMethodId) {

    }

    @Override
    public List<PaymentMethod> getPaymentMethods() {
        return null;
    }

    @Override
    public PaymentMethod getPaymentMethodById(Integer paymentMethodId) {
        return null;
    }

    @Override
    public void saveBillable(Billable billable) {

    }

    @Override
    public void deleteBillable(Integer billableId) {

    }

    @Override
    public List<Billable> getBillables() {
        return null;
    }

    @Override
    public Billable getBillableById(Integer billableId) {
        return null;
    }

    @Override
    public void saveTransactionType(TransactionType transactionType) {

    }

    @Override
    public void deleteTransactionType(Integer transactionTypeId) {

    }

    @Override
    public List<TransactionType> getTransactionTypes() {
        return null;
    }

    @Override
    public TransactionType getTransactionTypeById(Integer transactionTypeId) {
        return null;
    }
}
