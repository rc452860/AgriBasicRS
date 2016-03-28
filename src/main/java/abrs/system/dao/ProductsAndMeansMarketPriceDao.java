package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-29.
 */
import abrs.system.dao.Entity.ProductsAndMeansMarketPrice;
import org.springframework.stereotype.Repository;

@Repository
public class ProductsAndMeansMarketPriceDao extends MongoGenDao<ProductsAndMeansMarketPrice>{

    /**
     * 返回反射的类型
     */
    @Override
    protected Class<ProductsAndMeansMarketPrice> getEntityClass() {
        return ProductsAndMeansMarketPrice.class;
    }
}
