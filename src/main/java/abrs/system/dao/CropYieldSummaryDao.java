package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-27.
 */
import abrs.system.dao.Entity.CropYieldSummary;
import org.springframework.stereotype.Repository;

@Repository
public class CropYieldSummaryDao extends MongoGenDao<CropYieldSummary> {
    /**
     * ���ط��������
     */
    @Override
    protected Class<CropYieldSummary> getEntityClass() { return CropYieldSummary.class; }
}
