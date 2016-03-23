package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-23.
 */
import abrs.system.dao.Entity.Region;
import org.springframework.stereotype.Repository;

@Repository
public class RegionDao extends MongoGenDao<Region>{

    /**
     * 返回反射的类型
     */
    @Override
    protected Class<Region> getEntityClass() {
        return Region.class;
    }
}
