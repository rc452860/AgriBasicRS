package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-28.
 */
import abrs.system.dao.Entity.CostBenefitProductivityOfPlant;
import org.springframework.stereotype.Repository;

@Repository
public class CostBenefitProductivityOfPlantDao extends MongoGenDao<CostBenefitProductivityOfPlant> {

    /**
     * 返回反射的类型
     */
    @Override
    protected Class<CostBenefitProductivityOfPlant> getEntityClass() {
        return CostBenefitProductivityOfPlant.class;
    }
}