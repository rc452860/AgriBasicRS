package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-23.
 */
import abrs.system.dao.Entity.WholeYearPlantArea;
import org.springframework.stereotype.Repository;

@Repository
public class WholeYearPlantAreaDao extends MongoGenDao<WholeYearPlantArea>{
    /**
     * 返回反射的类型
     */
    @Override
    protected Class<WholeYearPlantArea> getEntityClass() {
        return WholeYearPlantArea.class;
    }

}
