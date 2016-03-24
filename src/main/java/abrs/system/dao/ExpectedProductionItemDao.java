package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-23.
 */
import abrs.system.dao.Entity.ExpectedProductionItem;
import org.springframework.stereotype.Repository;

@Repository
public class ExpectedProductionItemDao extends MongoGenDao<ExpectedProductionItem> {

    /**
     * ���ط��������
     */
    @Override
    protected Class<ExpectedProductionItem> getEntityClass() {
        return ExpectedProductionItem.class;
    }
}
