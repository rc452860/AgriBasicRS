package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.RegistrationForm;
import abrs.system.dao.Entity.User;
import abrs.system.dao.RegistrationFormDao;
import abrs.system.web.context.SessionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import static abrs.system.aspect.Auth.*;

/**
 * Created by Edifi_000 on 2016-03-24.
 */

@Service
public class RegistrationFormService {
    private static Logger logger = LoggerFactory.getLogger(RegistrationFormService.class);

    @Autowired
    private RegistrationFormDao registrationFormDao;
    @Autowired
    private RegionService regionService;

    @Autowired
    private HttpSession session;

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

    public RegistrationForm getItemByWorkFlowId(String workFlowId)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("workflow_id").is(workFlowId));
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

    public List<RegistrationForm> getItems(RegistrationForm conditions,int start, int size){
        Query query = new Query();
        Criteria cr = new Criteria();
        List<Criteria> querylist = new ArrayList<Criteria>();
        if(conditions!=null)
        {
            if(conditions.getRegion_id()!=null)
            {
                querylist.add(Criteria.where("region_id").is(conditions.getRegion_id()));
            }
            if(querylist.size()>1){
                query.addCriteria(cr.andOperator(querylist.toArray(new Criteria[querylist.size()])));
            }
            if (querylist.size() == 1){
                query.addCriteria(querylist.get(0));
            }
        }
        return registrationFormDao.getPage(query, start, size);
    }

    public List<RegistrationForm> getItemsInWorkFlowIds(List<String> workflowids,int start, int size){
        Query query = new Query();
        if(workflowids!=null)
        {
            query.addCriteria(Criteria.where("workflow_id").in(workflowids));
        }
        return registrationFormDao.getPage(query, start, size);
    }

    public List<RegistrationForm> getAvailableRegister() {
        Query query = new Query();
        query.addCriteria(Criteria.where("end_date").gte(new Date()));
        return registrationFormDao.queryList(query);
    }
    public List<RegistrationForm> getAvailableRegister(Date end_date) {
        User user = (User)session.getAttribute(SessionContext.CURRENT_USER);
        Role role  = (Role) session.getAttribute(SessionContext.CURRENT_USER_ROLE);

        Query query = new Query();
        Criteria cr = new Criteria();
        String regionCode = user.getRegionCode();
        Pattern pattern;
        //如果权限为farmer就只能看到自己区域的调查表
        if(role.ordinal()> Role.USER.ordinal()){
            pattern = regionService.getDescendantsPattern(regionCode);
        }else{
            pattern = Pattern.compile(regionCode);
        }
        cr.andOperator(Criteria.where("end_date").gte(end_date),Criteria.where("region_id").regex(pattern));
        query.addCriteria(cr);

        return registrationFormDao.queryList(query);
    }
    public List<RegistrationForm> getAvailableRegister(String form_type) {
        User user = (User)session.getAttribute(SessionContext.CURRENT_USER);
        Role role  = (Role) session.getAttribute(SessionContext.CURRENT_USER_ROLE);

        Query query = new Query();
        Criteria cr = new Criteria();
        String regionCode = user.getRegionCode();
        Pattern pattern;
        //如果权限为farmer就只能看到自己区域的调查表
        if(role.ordinal()> Role.USER.ordinal()){
            pattern = regionService.getDescendantsPattern(regionCode);
        }else{
            pattern = Pattern.compile(regionCode);
        }
        cr.andOperator(Criteria.where("end_date").gte(new Date()),Criteria.where("form_type").is(form_type),Criteria.where("region_id").regex(pattern));
        query.addCriteria(cr);
        return registrationFormDao.queryList(query);
    }

    public List<RegistrationForm> getAvailableRegister(String form_type,Date end_date) {
        User user = (User)session.getAttribute(SessionContext.CURRENT_USER);
        Role role  = (Role) session.getAttribute(SessionContext.CURRENT_USER_ROLE);

        Query query = new Query();
        Criteria cr = new Criteria();
        String regionCode = user.getRegionCode();
        Pattern pattern;
        //如果权限为farmer就只能看到自己区域的调查表
        if(role.ordinal()> Role.USER.ordinal()){
            pattern = regionService.getDescendantsPattern(regionCode);
        }else{
            pattern = Pattern.compile(regionCode);
        }
        cr.andOperator(Criteria.where("end_date").gte(end_date),Criteria.where("form_type").is(form_type),Criteria.where("region_id").regex(pattern));
        query.addCriteria(cr);
        return registrationFormDao.queryList(query);
    }

    public RegistrationForm getByCode(String code){
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(code));
        return registrationFormDao.queryOne(query);
    }
}
