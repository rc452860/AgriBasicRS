package abrs.system.service;

import abrs.system.dao.MongoGenDao;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Edifi_000 on 2016-05-06.
 */
public class BaseService {

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
                    }
                }
            }catch (IllegalAccessException ex){
                ex.printStackTrace();
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
