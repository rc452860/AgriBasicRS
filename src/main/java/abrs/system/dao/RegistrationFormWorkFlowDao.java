package abrs.system.dao;

import abrs.system.dao.Entity.RegistrationFormWorkFlow;
import org.springframework.stereotype.Repository;

/**
 * Created by Edifi_000 on 2016-04-17.
 */
@Repository
public class RegistrationFormWorkFlowDao extends MongoGenDao<RegistrationFormWorkFlow> {
    /**
     * 返回反射的类型
     */
    @Override
    protected Class<RegistrationFormWorkFlow> getEntityClass() {
        return RegistrationFormWorkFlow.class;
    }
}
