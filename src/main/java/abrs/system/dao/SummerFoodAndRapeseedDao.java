package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-23.
 */
import abrs.system.dao.Entity.SummerFoodAndRapeseed;
import org.springframework.stereotype.Repository;

@Repository
public class SummerFoodAndRapeseedDao extends MongoGenDao<SummerFoodAndRapeseed> {

    /**
     * ���ط��������
     */
    @Override
    protected Class<SummerFoodAndRapeseed> getEntityClass() {
        return SummerFoodAndRapeseed.class;
    }
}
