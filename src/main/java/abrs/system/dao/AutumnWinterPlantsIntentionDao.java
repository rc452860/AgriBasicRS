package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-25.
 */
import abrs.system.dao.Entity.AutumnWinterPlantsIntention;
import org.springframework.stereotype.Repository;

@Repository
public class AutumnWinterPlantsIntentionDao extends MongoGenDao<AutumnWinterPlantsIntention> {

    /**
     * 返回反射的类型
     */
    @Override
    protected Class<AutumnWinterPlantsIntention> getEntityClass() {
        return AutumnWinterPlantsIntention.class;
    }
}
