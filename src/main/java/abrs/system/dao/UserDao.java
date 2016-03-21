package abrs.system.dao;

import abrs.system.dao.Entity.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao extends MongoGenDao<User> {

    /**
     * 返回反射的类型
     */
    @Override
    protected Class<User> getEntityClass() {
        return User.class;
    }
}
