package abrs.system.service;

import abrs.system.dao.MongoGenDao;
import org.springframework.data.mongodb.core.query.Query;

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
        //TODO 将为数字的属性初始化一个用于判断是否该出被附值的特殊值
        return t;
    }

    public <T> List<T> getCommonList(T condition) {
        //TODO 反射判断将有作为条件值的对象进行设置条件
        return ((MongoGenDao<T>)getDao()).queryList(new Query());
    }
}
