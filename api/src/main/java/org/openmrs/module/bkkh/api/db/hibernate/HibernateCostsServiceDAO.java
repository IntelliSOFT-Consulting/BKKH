package org.openmrs.module.bkkh.api.db.hibernate;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.openmrs.Patient;
import org.openmrs.module.bkkh.Costs;
import org.openmrs.module.bkkh.api.db.CostsServiceDAO;

import java.util.List;

/**
 * Created by USER on 01/12/2015.
 */
public class HibernateCostsServiceDAO implements CostsServiceDAO {

    protected final Log log = LogFactory.getLog(this.getClass());

    private SessionFactory sessionFactory;

    /**
     * @param sessionFactory the sessionFactory to set
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void saveCosts(Costs costs) {
        sessionFactory.getCurrentSession().saveOrUpdate(costs);
    }

    @SuppressWarnings("unchecked")
    public List<Costs> getCosts(Patient patient) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Costs.class, "costs");
        if (patient != null) {
            criteria.add(Restrictions.eq("costs.patient", patient));
        }
        return (List<Costs>)criteria.list();
    }

    @SuppressWarnings("unchecked")
    public Costs getLastCosts(Patient patient) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Costs.class);
        criteria.addOrder(Order.desc("date"));
        criteria.setMaxResults(1);
        List<Costs> costsList = criteria.list();
        return costsList.size() > 0 ? costsList.get(0) : null;
    }
}
