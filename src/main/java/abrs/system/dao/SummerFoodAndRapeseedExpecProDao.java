package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-23.
 */
import abrs.system.dao.Entity.SummerFoodAndRapeseedExpecPro;
import org.springframework.stereotype.Repository;

@Repository
public class SummerFoodAndRapeseedExpecProDao extends MongoGenDao<SummerFoodAndRapeseedExpecPro> {

    /**
     * 返回反射的类型
     */
    @Override
    protected Class<SummerFoodAndRapeseedExpecPro> getEntityClass() {
        return SummerFoodAndRapeseedExpecPro.class;
    }
}
