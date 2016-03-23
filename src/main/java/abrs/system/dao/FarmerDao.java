package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-23.
 */
import abrs.system.dao.Entity.Farmer;
import org.springframework.stereotype.Repository;

@Repository
public class FarmerDao extends MongoGenDao<Farmer> {

    /**
     * ���ط��������
     */
    @Override
    protected Class<Farmer> getEntityClass() {
        return Farmer.class;
    }
}
