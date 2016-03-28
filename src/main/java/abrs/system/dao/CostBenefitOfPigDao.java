package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-28.
 */
import abrs.system.dao.Entity.CostBenefitOfPig;
        import org.springframework.stereotype.Repository;

@Repository
public class CostBenefitOfPigDao extends MongoGenDao<CostBenefitOfPig> {

    /**
     * 返回反射的类型
     */
    @Override
    protected Class<CostBenefitOfPig> getEntityClass() {
        return CostBenefitOfPig.class;
    }
}