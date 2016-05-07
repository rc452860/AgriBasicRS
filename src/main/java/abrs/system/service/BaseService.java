package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.RegistrationForm;
import abrs.system.dao.Entity.User;
import abrs.system.dao.MongoGenDao;
import abrs.system.web.context.SessionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Edifi_000 on 2016-05-06.
 */
public class BaseService {

    @Autowired
    private RegistrationFormService extRegistrationFormService;
    @Autowired
    HttpSession extsession;

    public Object getDao()
    {
        return null;
    }

    public <T> T defautConditionEntity(T t) {
        //TODO 将为数字的属性初始化一个用于判断是否该出被附值的特殊值(-9998)
        Field[] fields=t.getClass().getDeclaredFields();
        for (Field field : fields){
            field.setAccessible(true);
            String type = field.getType().toString();
            if(type.equals("class java.lang.Double")||type.equals("class java.lang.Integer")
                    ||type.equals("int")||type.equals("double"))
            {
                try {
                    field.setInt(t,-9998);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }else if(type.equals("class java.util.Date"))
            {
                try {
                    field.set(t,null);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
        return t;
    }

    public <T> List<T> getCommonList(T condition) {
        //TODO 反射判断将有作为条件值的对象进行设置条件
        Query query = new Query();
        Criteria cr = new Criteria();
        List<Criteria> querylist = new ArrayList<Criteria>();
        Field[] fields=condition.getClass().getDeclaredFields();

        boolean isHasConditionForRegistrationForm = false;

        for (Field field : fields){
            field.setAccessible(true);
            String type = field.getType().toString();
            String name = field.getName();
            try{
                if(type.equals("class java.lang.Double")||type.equals("class java.lang.Integer")
                        ||type.equals("int")||type.equals("double")){
                    if(!field.get(condition).equals(-9998.0)&&!field.get(condition).equals(-9998))
                    {
                        querylist.add(Criteria.where(name).regex(field.get(condition).toString()));
                    }
                }else{
                    if(field.get(condition)!=null)
                    {
                        querylist.add(Criteria.where(name).regex(field.get(condition).toString()));
                        if(name.equals("registration_form_id"))
                        {
                            isHasConditionForRegistrationForm = true;
                        }
                    }
                }
            }catch (IllegalAccessException ex){
                ex.printStackTrace();
            }
        }

        User user = (User)extsession.getAttribute(SessionContext.CURRENT_USER);
        if(user.getUserRole().equals(Auth.Role.USER)){
            querylist.add(Criteria.where("farmer_id").is(user.getFarmer_id()));
        }else{
            if(!isHasConditionForRegistrationForm)
            {
                List<RegistrationForm> list = extRegistrationFormService.getAvailableRegister(new Date(0));
                List<String> listRegistrationFormId = new ArrayList<String>();
                for(RegistrationForm form : list)
                {
                    listRegistrationFormId.add(form.getId());
                }
                querylist.add(Criteria.where("registration_form_id").in(listRegistrationFormId));
            }
        }

        if(querylist.size()>1){
            query.addCriteria(cr.andOperator(querylist.toArray(new Criteria[querylist.size()])));
        }
        if (querylist.size() == 1){
            query.addCriteria(querylist.get(0));
        }
        return ((MongoGenDao<T>)getDao()).queryList(query);
    }
}
