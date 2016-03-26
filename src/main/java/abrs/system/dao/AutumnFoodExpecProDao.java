package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-25.
 */
import abrs.system.dao.Entity.AutumnFoodExpecPro;
import org.springframework.stereotype.Repository;

@Repository
public class AutumnFoodExpecProDao extends MongoGenDao<AutumnFoodExpecPro> {

    /**
     * ���ط��������
     */
    @Override
    protected Class<AutumnFoodExpecPro> getEntityClass() {
        return AutumnFoodExpecPro.class;
    }
}
