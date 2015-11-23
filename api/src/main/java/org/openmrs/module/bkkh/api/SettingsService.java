package org.openmrs.module.bkkh.api;

import org.openmrs.module.bkkh.Billable;
import org.openmrs.module.bkkh.PaymentMethod;
import org.openmrs.module.bkkh.TransactionType;

import java.util.List;

/**
 * Created by gitahi on 23/11/15.
 */
public interface SettingsService {

    void savePaymentMethod(PaymentMethod paymentMethod);

    void deletePaymentMethod(Integer paymentMethodId);

    List<PaymentMethod> getPaymentMethods();

    PaymentMethod getPaymentMethodById(Integer paymentMethodId);

    void saveBillable(Billable billable);

    void deleteBillable(Integer billableId);

    List<Billable> getBillables();

    Billable getBillableById(Integer billableId);

    void saveTransactionType(TransactionType transactionType);

    void deleteTransactionType(Integer transactionTypeId);

    List<TransactionType> getTransactionTypes();

    TransactionType getTransactionTypeById(Integer transactionTypeId);
}
