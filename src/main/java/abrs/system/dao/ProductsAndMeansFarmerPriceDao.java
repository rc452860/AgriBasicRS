package abrs.system.dao;

/**
 * Created by Edifi_000 on 2016-03-29.
 */
import abrs.system.dao.Entity.ProductsAndMeansFarmerPrice;
import org.springframework.stereotype.Repository;

@Repository
public class ProductsAndMeansFarmerPriceDao extends MongoGenDao<ProductsAndMeansFarmerPrice>{

    /**
     * 返回反射的类型
     */
    @Override
    protected Class<ProductsAndMeansFarmerPrice> getEntityClass() {
        return ProductsAndMeansFarmerPrice.class;
    }
}
