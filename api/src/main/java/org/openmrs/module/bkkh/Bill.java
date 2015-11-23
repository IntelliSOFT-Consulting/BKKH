package org.openmrs.module.bkkh;

import org.openmrs.BaseOpenmrsObject;
import org.openmrs.Patient;

import java.util.Date;

/**
 * Created by gitahi on 23/11/15.
 */
public class Bill extends BaseOpenmrsObject {

    private Integer id;
    private Patient patient;
    private Date date;

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }
}
