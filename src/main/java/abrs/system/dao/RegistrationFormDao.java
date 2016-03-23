package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-23.
 */
import abrs.system.dao.Entity.RegistrationForm;
import org.springframework.stereotype.Repository;

@Repository
public class RegistrationFormDao extends MongoGenDao<RegistrationForm> {

    /**
     * 返回反射的类型
     */
    @Override
    protected Class<RegistrationForm> getEntityClass() {
        return RegistrationForm.class;
    }
}
