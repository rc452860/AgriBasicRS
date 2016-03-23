package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-23.
 */
import abrs.system.dao.Entity.SummerFoodAndRapeseedItem;
import org.springframework.stereotype.Repository;

@Repository
public class SummerFoodAndRapeseedItemDao extends MongoGenDao<SummerFoodAndRapeseedItem> {

    /**
     * ���ط��������
     */
    @Override
    protected Class<SummerFoodAndRapeseedItem> getEntityClass() {
        return SummerFoodAndRapeseedItem.class;
    }
}
