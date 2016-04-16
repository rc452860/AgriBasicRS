package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.ProductsAndMeansMarketPrice;
import abrs.system.dao.ProductsAndMeansMarketPriceDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-29.
 */

@Service
public class ProductsAndMeansMarketPriceService {
    private static Logger logger = LoggerFactory.getLogger(ProductsAndMeansMarketPriceService.class);

    @Autowired
    private ProductsAndMeansMarketPriceDao productsAndMeansMarketPriceDao;

    public boolean addItem(ProductsAndMeansMarketPrice productsAndMeansMarketPrice)
    {
        productsAndMeansMarketPriceDao.save(productsAndMeansMarketPrice);
        logger.info("Add ProductsAndMeansMarketPrice");
        return true;
    }

    public ProductsAndMeansMarketPrice getItem(String id)
    {
        return productsAndMeansMarketPriceDao.queryById(id);
    }

    public long getCount() {
        return productsAndMeansMarketPriceDao.getCount(new Query());
    }

    public boolean updateItem(ProductsAndMeansMarketPrice productsAndMeansMarketPrice)
    {
        productsAndMeansMarketPriceDao.save(productsAndMeansMarketPrice);
        logger.info("Update ProductsAndMeansMarketPrice");
        return true;
    }

    public void remove(String id)
    {
        productsAndMeansMarketPriceDao.deleteById(id);
    }

    public void removeMulit(String[] ids){
        productsAndMeansMarketPriceDao.deleteByIdMulit(ids);
    }

    public List<ProductsAndMeansMarketPrice> getItems(int start, int size){
        return productsAndMeansMarketPriceDao.getPage(new Query(), start, size);
    }
}
