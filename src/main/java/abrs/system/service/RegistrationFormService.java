package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.RegistrationForm;
import abrs.system.dao.RegistrationFormDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-24.
 */

@Service
public class RegistrationFormService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private RegistrationFormDao registrationFormDao;

    public boolean addItem(RegistrationForm registrationForm)
    {
        registrationFormDao.save(registrationForm);
        logger.info("Add RegistrationForm");
        return true;
    }

    public boolean addItem(String no,String name,String form_type,Boolean multidata,Date record_date,Date end_date
            ,String record_entity,String record_person_name,String record_person_phone)
    {
        RegistrationForm registrationForm = new RegistrationForm();
        registrationForm.setNo(no);
        registrationForm.setName(name);
        registrationForm.setForm_type(form_type);
        registrationForm.setIs_multidata(multidata);
        registrationForm.setRecord_date(record_date);
        registrationForm.setEnd_date(end_date);
        registrationForm.setRecord_entity(record_entity);
        registrationForm.setRecord_person_name(record_person_name);
        registrationForm.setRecord_person_phone(record_person_phone);
        registrationFormDao.save(registrationForm);
        logger.info("Add RegistrationForm: " + no + "/" + name);
        return true;
    }

    public RegistrationForm getItem(String id)
    {
        return registrationFormDao.queryById(id);
    }

    public RegistrationForm getItemByNo(String no)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(no));
        RegistrationForm registrationForm = registrationFormDao.queryOne(query);
        return registrationForm;
    }

    public long getCount() {
        return registrationFormDao.getCount(new Query());
    }

    public boolean updateItem(RegistrationForm region)
    {
        registrationFormDao.save(region);
        logger.info("Update Region");
        return true;
    }

    public void remove(String id)
    {
        registrationFormDao.deleteById(id);
    }

    public void removeMulit(String[] ids){
        registrationFormDao.deleteByIdMulit(ids);
    }

    public List<RegistrationForm> getItems(int start, int size){
        return registrationFormDao.getPage(new Query(), start, size);
    }
}
