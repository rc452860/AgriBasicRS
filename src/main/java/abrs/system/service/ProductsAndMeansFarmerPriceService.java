package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.ProductsAndMeansFarmerPrice;
import abrs.system.dao.ProductsAndMeansFarmerPriceDao;
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
public class ProductsAndMeansFarmerPriceService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private ProductsAndMeansFarmerPriceDao productsAndMeansFarmerPriceDao;

    public boolean addItem(ProductsAndMeansFarmerPrice productsAndMeansFarmerPrice)
    {
        productsAndMeansFarmerPriceDao.save(productsAndMeansFarmerPrice);
        logger.info("Add ProductsAndMeansFarmerPrice");
        return true;
    }

    public ProductsAndMeansFarmerPrice getItem(String id)
    {
        return productsAndMeansFarmerPriceDao.queryById(id);
    }

    public long getCount() {
        return productsAndMeansFarmerPriceDao.getCount(new Query());
    }

    public boolean updateItem(ProductsAndMeansFarmerPrice productsAndMeansFarmerPrice)
    {
        productsAndMeansFarmerPriceDao.save(productsAndMeansFarmerPrice);
        logger.info("Update ProductsAndMeansFarmerPrice");
        return true;
    }

    public void remove(String id)
    {
        productsAndMeansFarmerPriceDao.deleteById(id);
    }

    public List<ProductsAndMeansFarmerPrice> getItems(int start, int size){
        return productsAndMeansFarmerPriceDao.getPage(new Query(), start, size);
    }
}
